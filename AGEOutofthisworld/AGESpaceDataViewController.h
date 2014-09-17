//
//  AGESpaceDataViewController.h
//  AGEOutofthisworld
//
//  Created by Andrew Easton on 10/09/2014.
//  Copyright (c) 2014 IOS7Course-age. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGEotwSpaceObject.h"

@interface AGESpaceDataViewController : UIViewController < UITableViewDelegate, UITableViewDataSource > //conforming to the 2 protocols  Protocol is a list of methods that we can use
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) AGEotwSpaceObject *spaceObject;

@end
