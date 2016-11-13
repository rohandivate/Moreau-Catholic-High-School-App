//
//  Event.h
//  Moreau Catholic High School
//
//  Created by Rohan Divate on 8/12/15.
//  Copyright (c) 2015 Rohan Divate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject
{
    @public NSString *name;
    @public NSString *time;
}

- (id)initWithFirstName:(NSString *)aName
               lastName:(NSString *)aTime;



@end
