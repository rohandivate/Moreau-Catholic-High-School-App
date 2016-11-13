//
//  MoreauInfoViewController.h
//  Moreau Catholic High School
//
//  Created by Rohan Divate on 9/6/15.
//  Copyright (c) 2015 Rohan Divate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MoreauInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *address;
@property (weak, nonatomic) IBOutlet UITextView *phone;
@property (weak, nonatomic) IBOutlet MKMapView *map;
- (IBAction)dismiss:(id)sender;


@end
