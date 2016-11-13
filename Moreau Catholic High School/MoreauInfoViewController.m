//
//  MoreauInfoViewController.m
//  Moreau Catholic High School
//
//  Created by Rohan Divate on 9/6/15.
//  Copyright (c) 2015 Rohan Divate. All rights reserved.
//

#import "MoreauInfoViewController.h"

@interface MoreauInfoViewController ()

@end

@implementation MoreauInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MKCoordinateRegion myRegion;
    
    CLLocationCoordinate2D center;
    center.latitude = 37.644092;
    center.longitude = -122.059784;
    
    MKCoordinateSpan span;
    span.latitudeDelta = 0.01f;
    span.longitudeDelta = 0.01f;
    
    myRegion.center = center;
    myRegion.span = span;
    
    [_map setRegion:myRegion animated:YES];
    
    
    self.address.dataDetectorTypes = UIDataDetectorTypeAddress;
    self.address.text = @"27170 Mission Blvd,\nHayward, CA 94544";
    self.phone.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
    self.phone.text = @"(510) 881-4300";
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
