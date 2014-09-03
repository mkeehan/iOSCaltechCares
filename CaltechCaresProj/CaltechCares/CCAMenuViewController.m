//
//  CCAMenuViewController.m
//  CaltechCares
//
//  Created by Megan Keehan on 8/26/14.
//  Copyright (c) 2014 Megan Keehan. All rights reserved.
//

#import "CCAMenuViewController.h"
#import "CCAAppDelegate.h"
#import "CCAConstants.h"

@interface CCAMenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSMutableArray *isOpenArray;

@end

@implementation CCAMenuViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.view.backgroundColor = [UIColor colorFromHexString:BACKGROUND_COLOR];
        
        self.dataArray = [CCAConstants getDataArray];
        self.isOpenArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < self.dataArray.count; i++)
        {
            [self.isOpenArray addObject:[NSNumber numberWithBool:NO]];
        }
        
        UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width - PEEK_WIDTH, 200.0)];
        coverView.backgroundColor = [UIColor colorFromHexString:BUTTON_COLOR];
        [self.view addSubview:coverView];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width - PEEK_WIDTH, [[UIScreen mainScreen] bounds].size.height - 20)];
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.view addSubview:self.tableView];
    }
    return self;
}

#pragma mark - Table Protocol

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (![self.isOpenArray[section] boolValue])
    {
        return 0;
    }
    if (section == self.dataArray.count - 1)
    {
        return 1;
    }
    return [self.dataArray[section][1] count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    UIButton *welcomeView = [[UIButton alloc] init];
    [welcomeView addTarget:self action:@selector(sectionTouched:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 7, screenWidth - 55, 27)];
    [label setText:self.dataArray[section][0]];
    [label setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    [label setTextColor:[UIColor whiteColor]];
    [welcomeView addSubview:label];
    
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 45 - 3, screenWidth - PEEK_WIDTH, 1)];
    lineView2.backgroundColor = [UIColor colorFromHexString:@"#999999"];
    [welcomeView addSubview:lineView2];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 45 - 2, screenWidth - PEEK_WIDTH, 2)];
    lineView.backgroundColor = [UIColor colorFromHexString:CALTECH_COLOR];
    [welcomeView addSubview:lineView];

    welcomeView.backgroundColor = [UIColor colorFromHexString:BUTTON_COLOR];
    welcomeView.tag = section;
    return welcomeView;
}

- (void)sectionTouched:(UIButton *)sender
{
    NSNumber *currVal = [self.isOpenArray objectAtIndex:sender.tag];
    [self.isOpenArray setObject:[NSNumber numberWithBool:![currVal boolValue]] atIndexedSubscript:sender.tag];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CCAAppDelegate *app = [[UIApplication sharedApplication] delegate];
    if (indexPath.section == self.dataArray.count - 1)
    {
        [app openMap];
        return;
    }
    [app updateCenterView:self.dataArray[indexPath.section][1][indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InfoViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"InfoViewCell"];
    }
    [cell.textLabel setText:self.dataArray[indexPath.section][1][indexPath.row][0]];
    [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-light" size:15]];
    cell.textLabel.numberOfLines = 2;
    cell.backgroundColor = [UIColor colorFromHexString:BACKGROUND_COLOR];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0; //[CCADefaultViewCell getRowHeightWithData:self.rowData[indexPath.row]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45.0;
}

@end
