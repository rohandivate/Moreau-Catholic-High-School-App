//
//  Person.m
//  Moreau Catholic High School
//
//  Created by Rohan Divate on 6/24/15.
//  Copyright (c) 2015 Rohan Divate. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)initWithName:(NSString *)aName
        Department:(NSString *)aDepartment
          Position:(NSString *)aPosition
             Phone:(NSString *)aPhone
             Email:(NSString *)aEmail
            Index:(NSString *)aIndex
{
    if( self = [super init] )
    {
        name = aName;
        department = aDepartment;
        position = aPosition;
        phone = aPhone;
        email = aEmail;
        index = aIndex;
    }
    
    return self;

}

@end
