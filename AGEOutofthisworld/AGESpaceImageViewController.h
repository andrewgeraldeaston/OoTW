//
//  AGESpaceImageViewController.h
//  AGEOutofthisworld
//
//  Created by Andrew Easton on 02/09/2014.
//  Copyright (c) 2014 IOS7Course-age. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGEotwSpaceObject.h"


@interface AGESpaceImageViewController : UIViewController <UIScrollViewDelegate>


@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) AGEotwSpaceObject *spaceObject;

@end
