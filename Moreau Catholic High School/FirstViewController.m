//
//  FirstViewController.m
//  Moreau Catholic High School
//
//  Created by Rohan Divate on 6/24/15.
//  Copyright (c) 2015 Rohan Divate. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (nonatomic, strong) NSArray *pageImages;
@property (nonatomic, strong) NSMutableArray *pageViews;

- (void)loadVisiblePages;
- (void)loadPage:(NSInteger)page;
- (void)purgePage:(NSInteger)page;

@end

@implementation FirstViewController {
    NSMutableArray *tableData;
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // Load the pages that are now on screen
    [self loadVisiblePages];
}


- (void)loadVisiblePages {
    // First, determine which page is currently visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    NSInteger page = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    
    // Update the page control
    self.pageControl.currentPage = page;
    
    // Work out which pages you want to load
    NSInteger firstPage = page - 1;
    NSInteger lastPage = page + 1;
    
    // Purge anything before the first page
    for (NSInteger i=0; i<firstPage; i++) {
        [self purgePage:i];
    }
    
    // Load pages in our range
    for (NSInteger i=firstPage; i<=lastPage; i++) {
        [self loadPage:i];
    }
    
    // Purge anything after the last page
    for (NSInteger i=lastPage+1; i<self.pageImages.count; i++) {
        [self purgePage:i];
        

    }
    
}



- (void)purgePage:(NSInteger)page {
    if (page < 0 || page >= self.pageImages.count) {
        // If it's outside the range of what you have to display, then do nothing
        return;
    }
    
    // Remove a page from the scroll view and reset the container array
    UIView *pageView = [self.pageViews objectAtIndex:page];
    if ((NSNull*)pageView != [NSNull null]) {
        [pageView removeFromSuperview];
        [self.pageViews replaceObjectAtIndex:page withObject:[NSNull null]];
    }
}

- (void)loadPage:(NSInteger)page {
    if (page < 0 || page >= self.pageImages.count) {
        // If it's outside the range of what you have to display, then do nothing
        return;
    }
    
    // 1

    UIView *pageView = [self.pageViews objectAtIndex:page];
    if ((NSNull*)pageView == [NSNull null]) {
        // 2
        CGRect frame = self.scrollView.bounds;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0.0f;
        
        // 3
        UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImages objectAtIndex:page]];
        newPageView.contentMode = UIViewContentModeScaleAspectFit;
        newPageView.frame = frame;
        [self.scrollView addSubview:newPageView];

        // 4
        [self.pageViews replaceObjectAtIndex:page withObject:newPageView];
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageImages = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"photo1.png"],
                       [UIImage imageNamed:@"photo2.png"],
                       [UIImage imageNamed:@"photo3.png"],
                       [UIImage imageNamed:@"photo5.png"],
                       nil];
    
    NSInteger pageCount = self.pageImages.count;
    
    // 2
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = pageCount;
    
    // 3
    self.pageViews = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < pageCount; ++i) {
        [self.pageViews addObject:[NSNull null]];
    }
    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMMM dd, yyyy"];
    NSString *dateString = [dateFormatter stringFromDate:today];
    
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 4
    CGSize pagesScrollViewSize = self.scrollView.frame.size;
    self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImages.count, pagesScrollViewSize.height);
    
    // 5
    [self loadVisiblePages];
    
    self.tableView.estimatedRowHeight = 70.0; // for example. Set your average height
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView reloadData];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
    
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



- (IBAction)showInfo:(id)sender {
}
@end
