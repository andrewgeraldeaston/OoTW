//
//  AGESpaceImageViewController.m
//  AGEOutofthisworld
//
//  Created by Andrew Easton on 02/09/2014.
//  Copyright (c) 2014 IOS7Course-age. All rights reserved.
//

#import "AGESpaceImageViewController.h"

@interface AGESpaceImageViewController ()

@end

@implementation AGESpaceImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageView =[[UIImageView alloc] initWithImage:self.spaceObject.spaceImage]; // self.imageView =[[UIImageView alloc] initWithImage:[UIImage
    //imageNamed:@"Jupiter.jpg"]];
    self.scrollView.contentSize = self.imageView.frame.size;
    [self.scrollView addSubview:self.imageView];
    self.scrollView.delegate = self;
    self.scrollView.maximumZoomScale=2.0;
    self.scrollView.minimumZoomScale=0.5;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView // - add first letter
{
    
    return self.imageView;
    
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

@end
