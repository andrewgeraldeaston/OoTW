//
//  AGEotwAddSpaceObjectViewController.m
//  AGEOutofthisworld
//
//  Created by Andrew Easton on 10/09/2014.
//  Copyright (c) 2014 IOS7Course-age. All rights reserved.
//

#import "AGEotwAddSpaceObjectViewController.h"

@interface AGEotwAddSpaceObjectViewController ()

@end

@implementation AGEotwAddSpaceObjectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *orionImage = [UIImage imageNamed:@"Orion.jpg"];
    // all viewcontroller come with a view attached with them
    self.view.backgroundColor = [UIColor colorWithPatternImage:orionImage];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    
    [self.delegate didCancel];
    
}

// BLAH BLAH----------------------------------------------------------


- (IBAction)addButtonPressed:(UIButton *)sender {

    AGEotwSpaceObject *newSpaceObject = [self returnNewSpaceObject];
    [self.delegate addSpaceObject: newSpaceObject];
    
    
}


//BLAH BLAH -------------------------------------------------------------



-(AGEotwSpaceObject *)returnNewSpaceObject {
    
    AGEotwSpaceObject *addedSpaceObject = [[AGEotwSpaceObject alloc] init];
    addedSpaceObject.name = self.nameTextField.text;
    addedSpaceObject.nickname = self.nicknameTextField.text;
    addedSpaceObject.diameter = [self.diameterTextField.text floatValue];
    addedSpaceObject.temperature = [self.temperatureTextField.text intValue];
    addedSpaceObject.interestFact = self.interestingFactTextField.text;
    addedSpaceObject.numberOfMoons = [self.numberOfMoons.text intValue];
    
    addedSpaceObject.spaceImage = [UIImage imageNamed:@"EinsteinRing.jpg"]; // add default image.
    
    return addedSpaceObject;

}


@end

