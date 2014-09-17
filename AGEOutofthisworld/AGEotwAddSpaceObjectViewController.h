
//
//
//  AGEotwAddSpaceObjectViewController.h
//  AGEOutofthisworld
//
//  Created by Andrew Easton on 10/09/2014.
//  Copyright (c) 2014 IOS7Course-age. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGEotwSpaceObject.h"   // allows us create AGEotwSpaceObjects inside the AGEothAddSpaceObjectViewContoller.m as well ad define things in our header file

@protocol AGEotwAddSpaceObjectViewControllerDelegate <NSObject>  // using a protocol to pass data  , (name of class and add delegate)

-(void)addSpaceObject:(AGEotwSpaceObject *)spaceObject; //implemented in the AGEOuterSapaceTableViewController
-(void)didCancel;  //implemented in the AGEOuterSapaceTableViewController


@end

@interface AGEotwAddSpaceObjectViewController : UIViewController

@property (weak, nonatomic) id <AGEotwAddSpaceObjectViewControllerDelegate> delegate;  //weak we want to avoid retain cycles (weak and deallocation)  delegate properties as weak / id of object type of unknown

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberOfMoons;
@property (strong, nonatomic) IBOutlet UITextField *interestingFactTextField;

- (IBAction)cancelButtonPressed:(UIButton *)sender;
- (IBAction)addButtonPressed:(UIButton *)sender;


@end


