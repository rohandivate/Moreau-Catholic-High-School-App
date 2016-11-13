//
//  FirstViewController.h
//  Moreau Catholic High School
//
//  Created by Rohan Divate on 6/24/15.
//  Copyright (c) 2015 Rohan Divate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface FirstViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;
- (IBAction)showInfo:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

