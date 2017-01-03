//
//  ViewController.m
//  MultiCellTypeTableViewOC
//
//  Created by Baitianyu on 8/25/16.
//  Copyright © 2016 HT. All rights reserved.
//

#import "ViewController.h"
#import "MCDemoTableDescribeData.h"
#import "MCDemoCell1.h"
#import "MCDemoCell2.h"
#import "MCDemoCell3.h"
#import "UITableView+MCRegisterCellClass.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, MCDemoCell2Delegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSArray<MCDemoTableDescribeData *> *> *cellDescriptionDatas;

@end

@implementation ViewController

#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MultiCellTypeTableViewOC";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadSubviews];
    [self loadCellDescribeDatas];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _tableView.frame = self.view.bounds;
}


#pragma mark - Load views.

- (void)loadSubviews {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor lightTextColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    // register cell class, use UITableView+MCRegisterCellClass
    [_tableView registerCellClasses:@[[MCDemoCell1 class],
                                      [MCDemoCell2 class],
                                      [MCDemoCell3 class]]];
}


#pragma mark - Load datas.

- (void)loadCellDescribeDatas {
    MCDemoTableDescribeData *cell1Data = [[MCDemoTableDescribeData alloc] init];
    cell1Data.cellClass = [MCDemoCell1 class];
    cell1Data.headerIconName = @"header_icon";
    cell1Data.content = @"cell1's content";
    
    MCDemoTableDescribeData *cell2Data = [[MCDemoTableDescribeData alloc] init];
    cell2Data.cellClass = [MCDemoCell2 class];
    cell2Data.title = @"cell2";
    cell2Data.content = @"cell2's content";
    cell2Data.switchStatus = YES;
    cell2Data.cell2Delegate = self;
    
    MCDemoTableDescribeData *cell3Data = [[MCDemoTableDescribeData alloc] init];
    cell3Data.cellClass = [MCDemoCell3 class];
    cell3Data.indicateImageName = @"indicate";
    cell3Data.title = @"cell3";
    cell3Data.subTitle = @"cell3's subtitle";
    
    _cellDescriptionDatas = @[@[cell1Data, cell2Data], @[cell3Data]];
}


#pragma mark - UITableViewDataSource.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _cellDescriptionDatas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellDescriptionDatas[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MCDemoTableDescribeData *data = _cellDescriptionDatas[indexPath.section][indexPath.row];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithClassType:data.cellClass];
    data.customCellBlock((MCTableBaseCell *)cell, data);
    return cell;
}


#pragma mark - UITableViewDelegate.

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MCDemoTableDescribeData *data = _cellDescriptionDatas[indexPath.section][indexPath.row];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithClassType:data.cellClass];
    data.customCellBlock((MCTableBaseCell *)cell, data);
    return [data cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MCDemoTableDescribeData *data = _cellDescriptionDatas[indexPath.section][indexPath.row];
    if (data.selectCellBlock) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        data.selectCellBlock((MCTableBaseCell *)cell, data);
    }
}


#pragma mark - MCDemoCell2Delegate

- (void)switchStatusChanged {
    NSLog(@"cell2's switch status changed");
}

@end
