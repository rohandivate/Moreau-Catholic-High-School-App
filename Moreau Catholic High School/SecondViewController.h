//
//  SecondViewController.h
//  Moreau Catholic High School
//
//  Created by Rohan Divate on 6/24/15.
//  Copyright (c) 2015 Rohan Divate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface SecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *todayView;
@property (weak, nonatomic) IBOutlet UIView *calendarView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)segmentValueChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
- (IBAction)rightClick:(id)sender;
- (IBAction)leftClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

