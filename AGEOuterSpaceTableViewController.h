//
//  AGEOuterSpaceTableViewController.h
//  AGEOutofthisworld
//
//  Created by Andrew Easton on 21/08/2014.
//  Copyright (c) 2014 IOS7Course-age. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGEotwAddSpaceObjectViewController.h"

@interface AGEOuterSpaceTableViewController : UITableViewController <AGEotwAddSpaceObjectViewControllerDelegate> // conform to protocol

@property(strong,nonatomic) NSMutableArray *planets;
@property(strong,nonatomic) NSMutableArray *addedSpaceObjects;





@end
