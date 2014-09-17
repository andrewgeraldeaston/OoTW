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
#import "AGESpaceDataViewController.h"

@interface AGEOuterSpaceTableViewController ()

@end

@implementation AGEOuterSpaceTableViewController

// ******************************************************

#pragma mark - Lazy Instantiation of Properties

-(NSMutableArray *)planets
{
    if (!_planets) {
        
        _planets = [[ NSMutableArray alloc] init];
        
    }
    
    return _planets;
    
    
}


-(NSMutableArray *)addedSpaceObjects
{
    if (!_addedSpaceObjects){
        
        _addedSpaceObjects = [[NSMutableArray alloc] init];
        
    }
    
    return _addedSpaceObjects;
    
} // ***************************************************


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

  
    // self.planets = [[NSMutableArray alloc] init];
    
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets])
    {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        AGEotwSpaceObject *planet = [[AGEotwSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
        
    }
 
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
            
            AGEotwSpaceObject *selectedObject;
            
            if (path.section ==0) {
                
                selectedObject = self.planets[path.row];
                
            } else if (path.section ==1) {
                
                selectedObject = self.addedSpaceObjects[path.row];
                
            }
            
           // = self.planets[path.row]; // use the NSIndexPath in order to index into the array of objects. (check the literal syntax)
            
            
            nextViewController.spaceObject = selectedObject; // set my next viewcontrollers property / right before i transition to my new viewcontroller and prepare for segue method. // IBOUTLET and UI ElEMENTS are not available to us in segue method. Only available to the viewcontroller after that viewcontroller is presented on the screen. We use a proxy property to hold onto the value and then in the VIEWDIDLOAD METHOD we can update the UI elements properly. Dont set UI properties inside the PREPAREFORSEGUE method. Create a property pass an object string/image/owspaceobject etc to new viewcongtroler now you have access to that object useing self and the name of that property and you can use it to update the elements inside the VIEWDIDLOAD method.
        }
        
    }
    
    
    if ([sender isKindOfClass:[NSIndexPath class]]) // performed segue with identifier we past sender a
    {
        if ([segue.destinationViewController isKindOfClass:[AGESpaceDataViewController class]]) //destination
        {
            AGESpaceDataViewController *targetViewController = segue.destinationViewController;
            NSIndexPath *path = sender;
            AGEotwSpaceObject *selectedObject;
            
            if ( path.section == 0 ) {
                selectedObject = self.planets[path.row];
                
            } else if (path.section == 1) {
                
                selectedObject = self.addedSpaceObjects[path.row];
                
            }
    
            targetViewController.spaceObject = selectedObject;
            
        }
        
    }
    if ([segue.destinationViewController isKindOfClass:[AGEotwAddSpaceObjectViewController class]]){
        AGEotwAddSpaceObjectViewController *addSpaceObjectVC = segue.destinationViewController;
        addSpaceObjectVC.delegate = self;  // setting the property addspaceobjectVC = setting to this VC so we can access inside the class
        // is the place i need to assign the image (YET TO FIND OUT)
        
    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AGEothSpaceObjectViewController Delegate

-(void)didCancel

{
    NSLog(@"Did Cancel" );
    [self dismissViewControllerAnimated:YES completion:nil]; //dismiss the vccontoller(addspaceVC) when its on top of the VC when its ontop
    
}

-(void)addSpaceObject:(AGEotwSpaceObject *)spaceObject {
    if (!self.addedSpaceObjects){
       // self.addedSpaceObjects = [[NSMutableArray alloc] init];
        
    }
    
    [self.addedSpaceObjects addObject:spaceObject];
    
    NSLog(@"Add Space Object");
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    // ***************************  RELOAD DATA ABOVE   *******************************
    // tableview controller when loaded grabs all the information but doesnt know we have updated the info ( add )
    
    [self.tableView reloadData]; //check again and should i update and with what info.
    
    // ***************************  RELOAD DATA ABOVE   *******************************
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    
    if ([self.addedSpaceObjects count])
        {
            return 2;
        }
        else {
        
            return 1;
        }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    if (section ==1){
        
        return [self.addedSpaceObjects count];
    }
    else {
        
        return [self.planets count];
    }
}
    
   //to make dynamic


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    
    if (indexPath.section ==1){
        
        //use new space object to customize our cell.
        //passing info back from one controller to another controller
        
        AGEotwSpaceObject *planet = [self.addedSpaceObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
        
    }
    
    else {
        AGEotwSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;  // CELLS default propoerty called Image.
    }
    
    cell.backgroundColor= [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];

    return cell;
}


#pragma mark UITableView Delegate


-(void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"accessory button is working properly %i", indexPath.row);
    [self performSegueWithIdentifier:@"Push to space data" sender:indexPath]; //sender passed indexpath and indexpath is of type NSIndexPath(see above 2 lines)
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
