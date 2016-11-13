//
//  DirectoryTableTableViewController.m
//  Moreau Catholic High School
//
//  Created by Rohan Divate on 6/24/15.
//  Copyright (c) 2015 Rohan Divate. All rights reserved.
//

#import "DirectoryTableTableViewController.h"

@interface DirectoryTableTableViewController () {
    NSMutableArray *directory1;
    NSDictionary *directory;
    NSArray *directorySectionTitles;
}

@end

@implementation DirectoryTableTableViewController

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    directory1 = [NSMutableArray array];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"directory"
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
        [directory1 addObject:[[Person alloc]initWithName:[singleStrs objectAtIndex:0] Department:[singleStrs objectAtIndex:1] Position:[singleStrs objectAtIndex:2] Phone:[singleStrs objectAtIndex:3] Email:[singleStrs objectAtIndex:4] Index:[singleStrs objectAtIndex:5]]];
    }
    
    
    directory = @{ @"A" : @[directory1[0],directory1[1],directory1[2],directory1[3],directory1[4],directory1[5]],
                   @"B" : @[directory1[6],directory1[7],directory1[8],directory1[9],directory1[10],directory1[11],directory1[12]],
                   @"C" : @[directory1[13],directory1[14],directory1[15],directory1[16],directory1[17],directory1[18],directory1[19],directory1[20]],
                   @"D" : @[directory1[21],directory1[22],directory1[23]],
                   @"F" : @[directory1[24],directory1[25],directory1[26],directory1[27]],
                   @"G" : @[directory1[28],directory1[29],directory1[30],directory1[31],directory1[32],directory1[33],directory1[34],directory1[35],directory1[36],directory1[37],directory1[38]],
                   @"H" : @[directory1[39],directory1[40],directory1[41],directory1[42],directory1[43],directory1[44],directory1[45]],
                   @"K" : @[directory1[46],directory1[47],directory1[48],directory1[49],directory1[50],directory1[51],directory1[52]],
                   @"L" : @[directory1[53],directory1[54],directory1[55],directory1[56],directory1[57],directory1[58]],
                   @"M" : @[directory1[59],directory1[60],directory1[61],directory1[62],directory1[63],directory1[64],directory1[65],directory1[66],directory1[67],directory1[68],directory1[69]],
                   @"N" : @[directory1[70],directory1[71],directory1[72]],
                   @"P" : @[directory1[73],directory1[74],directory1[75],directory1[76],directory1[77],directory1[78]],
                   @"R" : @[directory1[79],directory1[80],directory1[81],directory1[82],directory1[83],directory1[84]],
                   @"S" : @[directory1[85],directory1[86],directory1[87],directory1[88],directory1[89],directory1[90],directory1[91],directory1[92],directory1[93],directory1[94],directory1[95],directory1[96]],
                   @"T" : @[directory1[97],directory1[98],directory1[99],directory1[100],directory1[101],directory1[102],directory1[103]],
                   @"W" : @[directory1[104],directory1[105],directory1[106],directory1[107],directory1[108],directory1[109]],
                   @"Y" : @[directory1[110]],
                   @"Z" : @[directory1[111],directory1[112]]
                   };
    directorySectionTitles = [[directory allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [directorySectionTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *sectionTitle = [directorySectionTitles objectAtIndex:section];
    NSArray *sectionDirectory = [directory objectForKey:sectionTitle];
    return [sectionDirectory count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [directorySectionTitles objectAtIndex:section];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    Person *sectionTitle = [directorySectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionDirectory = [directory objectForKey:sectionTitle];
    Person *person = [sectionDirectory objectAtIndex:indexPath.row];
    cell.textLabel.text = person->name;
    
    return cell;
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return directorySectionTitles;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    InfoViewController *pvc = [segue destinationViewController];
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    Person *sectionTitle = [directorySectionTitles objectAtIndex:path.section];
    NSArray *sectionDirectory = [directory objectForKey:sectionTitle];
    Person *person = [sectionDirectory objectAtIndex:path.row];
    [pvc setCurrentPerson:person];
}
@end

