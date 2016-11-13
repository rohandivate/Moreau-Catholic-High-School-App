//
//  Person.h
//  Moreau Catholic High School
//
//  Created by Rohan Divate on 6/24/15.
//  Copyright (c) 2015 Rohan Divate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
@public NSString *name;
@public NSString *email;
@public    NSString *phone;
 @public   NSString *department;
  @public  NSString *position;
 @public   NSString *index;
}


- (id)initWithName:(NSString *)aName
                Department:(NSString *)aDepartment
                Position:(NSString *)aPosition
                Phone:(NSString *)aPhone
                Email:(NSString *)aEmail
                Index:(NSString *)aIndex;


@end
