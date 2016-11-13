//
//  Event.m
//  Moreau Catholic High School
//
//  Created by Rohan Divate on 8/12/15.
//  Copyright (c) 2015 Rohan Divate. All rights reserved.
//

#import "Event.h"

@implementation Event

- (id)initWithFirstName:(NSString *)aName
               lastName:(NSString *)aTime
{
    if( self = [super init] )
    {
        name = aName;
        time = aTime;
    }
    
    return self;
}


@end
