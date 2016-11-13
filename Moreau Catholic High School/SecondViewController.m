//
//  SecondViewController.m
//  Moreau Catholic High School
//
//  Created by Rohan Divate on 6/24/15.
//  Copyright (c) 2015 Rohan Divate. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@end

@implementation SecondViewController {
    NSMutableArray *tableData;
    NSDate *currentDate;
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)getDateEvents:(NSDate *)myDate {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"example"
                                                     ofType:@"txt"];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    NSArray* allLinedStrings = [content componentsSeparatedByCharactersInSet:
                                [NSCharacterSet newlineCharacterSet]];
    [tableData removeAllObjects];
    for (int i = 0; i < allLinedStrings.count; i++) {
        NSString* strsInOneLine = [allLinedStrings objectAtIndex:i];
        NSArray* singleStrs = [strsInOneLine componentsSeparatedByCharactersInSet:
                               [NSCharacterSet characterSetWithCharactersInString:@";"]];
        NSString *date = [singleStrs objectAtIndex:0];
        NSDateFormatter *format = [[NSDateFormatter alloc]init];
        [format setDateFormat:@"MMMM dd, yyyy"];
        NSString *datestr = [format stringFromDate:myDate];
        if ([date isEqualToString:datestr]) {
            for (int j = 1; j < singleStrs.count; j+=2) {
                [tableData addObject:[[Event alloc]initWithFirstName:[singleStrs objectAtIndex:j] lastName:[singleStrs objectAtIndex:j+1]]];
            }
        }
    }
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMMM dd, yyyy"];
    NSString *dateString = [dateFormatter stringFromDate:today];
    self.dateLabel.text = dateString;
    
    currentDate = [NSDate alloc];
    
    currentDate = today;
    
    tableData = [NSMutableArray array];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"example"
                                                     ofType:@"txt"];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    NSArray* allLinedStrings = [content componentsSeparatedByCharactersInSet:
                                [NSCharacterSet newlineCharacterSet]];
    for (int i = 0; i < allLinedStrings.count; i++) {
        NSString* strsInOneLine = [allLinedStrings objectAtIndex:i];
        NSArray* singleStrs = [strsInOneLine componentsSeparatedByCharactersInSet:
                                   [NSCharacterSet characterSetWithCharactersInString:@";"]];
        NSString *date = [singleStrs objectAtIndex:0];
        if ([date isEqualToString:dateString]) {
            for (int j = 1; j < singleStrs.count; j+=2) {
                [tableData addObject:[[Event alloc]initWithFirstName:[singleStrs objectAtIndex:j] lastName:[singleStrs objectAtIndex:j+1]]];
            }
        }
    }
    // Do any additional setup after loading the view, typically from a nib.
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.estimatedRowHeight = 70.0; // for example. Set your average height
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if(cell == nil)
    {
        //Create your cell
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    //Configure your cell
    Event *event = [tableData objectAtIndex:indexPath.row];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.text = event->name;
    cell.detailTextLabel.text = event->time;
    
    return cell;
}


- (IBAction)segmentValueChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self.calendarView setHidden:YES];
            [self.todayView setHidden:NO];
            break;
        case 1:
            [self.calendarView setHidden:NO];
            [self.todayView setHidden:YES];
            break;
    }
}


- (IBAction)rightClick:(id)sender {
    currentDate = [currentDate dateByAddingTimeInterval:60*60*24*1];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"MMMM dd, yyyy"];
    NSString *newDate = [format stringFromDate:currentDate];
    self.dateLabel.text = newDate;
    [self getDateEvents:currentDate];
}

- (IBAction)leftClick:(id)sender {
    currentDate = [currentDate dateByAddingTimeInterval:60*60*24*-1];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"MMMM dd, yyyy"];
    NSString *newDate = [format stringFromDate:currentDate];
    self.dateLabel.text = newDate;
    [self getDateEvents:currentDate];
}

@end
