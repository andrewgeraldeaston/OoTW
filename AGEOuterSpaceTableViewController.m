//
//  AGEOuterSpaceTableViewController.m
//  AGEOutofthisworld
//
//  Created by Andrew Easton on 21/08/2014.
//  Copyright (c) 2014 IOS7Course-age. All rights reserved.
//

#import "AGEOuterSpaceTableViewController.h"
#import "AstronomicalData.h"
#import "AGEotwSpaceObject.h"
#import "AGESpaceImageViewController.h"




@interface AGEOuterSpaceTableViewController ()

@end

@implementation AGEOuterSpaceTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
   // NSString *planet1 = @"Mercury";
   // NSString *planet2 = @"Venus";
   // NSString *planet3 = @"Earth";
   // NSString *planet4 = @"Mars";
   // NSString *planet5 = @"Jupiter";
   // NSString *planet6 = @"Saturn";
   // NSString *planet7 = @"Uranus";
   // NSString *planet8 = @"Neptune";
    
       // self.planets = [[NSMutableArray alloc] initWithObjects:planet1,planet2,planet3, planet4, planet5, planet6, planet7, planet8, nil];
    
    self.planets = [[NSMutableArray alloc] init];
    
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets])
    {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        AGEotwSpaceObject *planet = [[AGEotwSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
        
        
    }
 
//    [self.planets addObject:planet1];
//    [self.planets addObject:planet2];
//    [self.planets addObject:planet3];
//    [self.planets addObject:planet4];
//    [self.planets addObject:planet5];
//    [self.planets addObject:planet6];
//    [self.planets addObject:planet7];
//[self.planets addObject:planet8];

    
//    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
//    NSString *firstColor = @"red";
//    [myDictionary setObject:firstColor forKey:@"firetruck color"];
//    [myDictionary setObject:"@"blue" forKey"@"ocean color"];
//    [myDictionary setObject:@"yellow" forKey:@"star color"];
//     NSLog(@"%@", myDictionary);
//     NSString *blueString =[myDictionary objectForKey:@"ocean color"];
//     NSLog(@"%@", blueString);

    
    // NSNumber *myNumber = [NSNumber numberWithInt:5]; // passing in an
    // NSLog(@"%@", myNumber); // wrapping pirimitives in an object why - add numbers/pirmietives to an array and dictionaries only accept objects so in order to add an pirimitive to a dictionary/array first wrap it in a number
    // NSNumber *floatNumber = [NSNumber numberWithFloat:3.14];
    // NSLog(@"%@", floatNumber);
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender   // (what class an object is , powerful design pattern when you are going to transition to a new view as well as add code dynamically when you do that transition)
{
    
    // NSLog(@"%@", sender);
    
    if ([sender isKindOfClass:[UITableViewCell class]]) // great way of confirming  that the origin is a  UITableViewCell class
    {
        
        if ([segue.destinationViewController isKindOfClass:[AGESpaceImageViewController class]]) // confirming this is a destination is going to be a AGESpaceImageViewController
            // class method  call on the UITableViewCell - sender object is actually the UITableViewCell Class
            // id we create a button then this would not be true
        {
            
            // access the viewcontroller we are going to and access the properties of AGESpaceImageViewController specially the spaceobject property and set equal to the spaceobject im currently displaying on my UITableViewCell get that from my sender
            
            AGESpaceImageViewController *nextViewController = segue.destinationViewController; // allow to access the viewcontroller and also allow us to access the properties of AGESpaceImageViewController e.g. spaceobject property and therefore i can set that property (get the info from the sender)
            
            NSIndexPath *path = [self.tableView indexPathForCell:sender]; // where am i on my tableView  (give me back the indexpath for the indexpath for my cell ( i know because im passing this as an argument - not in my headerfile (tableview not as a property) because its a UItableviewcontroller aumtoatically get access to the controller e.g. self.tableview
            
            AGEotwSpaceObject *selectedObject = self.planets[path.row]; // use the NSIndexPath in order to index into the array of objects. (check the literal syntax)
            
            nextViewController.spaceObject = selectedObject; // set my next viewcontrollers property / right before i transition to my new viewcontroller and prepare for segue method. // IBOUTLET and UI ElEMENTS are not available to us in segue method. Only available to the viewcontroller after that viewcontroller is presented on the screen. We use a proxy property to hold onto the value and then in the VIEWDIDLOAD METHOD we can update the UI elements properly. Dont set UI properties inside the PREPAREFORSEGUE method. Create a property pass an object string/image/owspaceobject etc to new viewcongtroler now you have access to that object useing self and the name of that property and you can use it to update the elements inside the VIEWDIDLOAD method.
        }
        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
   //to make dynamic

    return [self.planets count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    
    
    AGEotwSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
    cell.textLabel.text = planet.name;
    cell.detailTextLabel.text = planet.nickname;
    cell.imageView.image = planet.spaceImage;  // CELLS default propoerty called Image.
    
    cell.backgroundColor= [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
