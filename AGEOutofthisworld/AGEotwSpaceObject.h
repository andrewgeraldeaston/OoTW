//
//  AGEotwSpaceObject.h
//  AGEOutofthisworld
//
//  Created by Andrew Easton on 27/08/2014.
//  Copyright (c) 2014 IOS7Course-age. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGEotwSpaceObject : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) float gravitationalForce;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temperature;
@property (nonatomic) float diameter;
@property (nonatomic) int numberOfMoons;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *interestFact;

@property (strong, nonatomic) UIImage *spaceImage;

-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image; // id returning an object but we dont know what type


@end

