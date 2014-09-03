//
//  CCAInfoTextViewController.m
//  CaltechCares
//
//  Created by Megan Keehan on 7/23/14.
//  Copyright (c) 2014 Megan Keehan. All rights reserved.
//

#import "CCAInfoTextViewController.h"
#import "CCAConstants.h"
#import "CCAAppDelegate.h"

@interface CCAInfoTextViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) UICollectionView *titleCollection;
@property (nonatomic, strong) UIButton *backButton;

@end

@implementation CCAInfoTextViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
        [button setShowsTouchWhenHighlighted:YES];
        [button addTarget:self action:@selector(openMenu) forControlEvents:UIControlEventTouchUpInside];
        [button setFrame:CGRectMake(0, 0, 35, 55)];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        //self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName, 2, nSNUMBERO, nil]

        self.view.backgroundColor = [UIColor whiteColor];
        self.rowData = [CCAConstants getDefaultDataArray];
        
        // getting screen sizes
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        
        self.tableView = [[UITableView alloc] init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView setShowsVerticalScrollIndicator:NO];
        [self.tableView.layer setCornerRadius:10.0];
        self.tableView.backgroundColor = [UIColor colorFromHexString:TEXT_BACKGROUND_COLOR];
        [self.tableView setFrame:CGRectMake(0, 10, screenWidth - 20, screenHeight)];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.allowsSelection = NO;
        [self.view addSubview:self.tableView];
        [self.tableView reloadData];
    }
    return self;
}

- (void) setRowData:(NSMutableArray *)rowData
{
    _rowData = rowData;
    if (rowData.count > 0) self.title = rowData[0];
    [self.tableView reloadData];
}

- (void) openMenu
{
    CCAAppDelegate *app = [[UIApplication sharedApplication] delegate];
    [app openMenu];
}

#pragma mark - Table Protocol

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rowData.count - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CCADefaultViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InfoViewCell"];
    if (!cell) {
        cell = [[CCADefaultViewCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"InfoViewCell"];
    }
    if (self.rowData.count > indexPath.row + 1)
    {
        [cell setData:self.rowData[indexPath.row + 1]];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.rowData.count > indexPath.row + 1)
    {
        return [CCADefaultViewCell getRowHeightWithData:self.rowData[indexPath.row + 1]];
    }
    return 0.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    return view;
}

@end