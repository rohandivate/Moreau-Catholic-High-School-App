//
//  InfoViewController.m
//  Moreau Catholic High School
//
//  Created by Rohan Divate on 6/24/15.
//  Copyright (c) 2015 Rohan Divate. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "InfoViewController.h"

@interface InfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *profileLabel;
@property (weak, nonatomic) IBOutlet UIImageView *directoryImage;
@property (weak, nonatomic) IBOutlet UILabel *directoryDepartment;
@property (weak, nonatomic) IBOutlet UILabel *directoryPosition;
@property (weak, nonatomic) IBOutlet UITextView *directoryEmail;
@property (weak, nonatomic) IBOutlet UITextView *directoryPhone;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;

@end

@implementation InfoViewController

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.directoryEmail.layer.borderWidth = 0.1;
    self.directoryEmail.layer.borderColor = [[UIColor blackColor] CGColor];
    self.directoryPhone.layer.borderWidth = 0.1;
    self.directoryPhone.layer.borderColor = [[UIColor blackColor] CGColor];
    self.directoryPhone.layer.cornerRadius = 8;
    self.directoryEmail.layer.cornerRadius = 8;
    self.directoryEmail.editable = NO;
    self.directoryEmail.dataDetectorTypes = UIDataDetectorTypeLink;
    self.directoryPhone.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
    self.profileLabel.text = self.currentPerson->name;
    self.directoryDepartment.text = self.currentPerson->department;
    self.directoryPosition.text = self.currentPerson->position;
    if ([self.currentPerson->email  isEqual: @""] && [self.currentPerson->phone  isEqual: @""]) {
        [self.view1 setHidden:NO];
        [self.view2 setHidden:NO];
    }
    else if ([self.currentPerson->email  isEqual: @""]) {
        [self.view1 setHidden:NO];
        self.directoryPhone.text = self.currentPerson->phone;
    }
    else if ([self.currentPerson->phone  isEqual: @""]) {
        [self.view2 setHidden:NO];
        self.directoryEmail.text = self.currentPerson->email;
    }
    else {
        [self.view1 setHidden:YES];
        [self.view2 setHidden:YES];
        self.directoryEmail.text = self.currentPerson->email;
        self.directoryPhone.text = self.currentPerson->phone;
    }
  //  UIImage *image = [UIImage imageNamed:self.currentPerson.filename];
    //[self.directoryImage setImage:image];
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

@end
