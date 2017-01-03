//
//  OldViewController.m
//  MultiCellTypeTableViewOC
//
//  Created by Baitianyu on 11/10/2016.
//  Copyright © 2016 HT. All rights reserved.
//

#import "OldViewController.h"
#import "MCDemoCell1.h"
#import "MCDemoCell2.h"
#import "MCDemoCell3.h"

@interface OldViewController () <UITableViewDelegate, UITableViewDataSource, MCDemoCell2Delegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation OldViewController

#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MultiCellTypeTableViewOC";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadSubviews];
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
}


#pragma mark - UITableViewDataSource.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell = [self getCell1];
        } else {
            cell = [self getCell2];
        }
    } else {
        cell = [self getCell3];
    }
    
    return cell;
}


#pragma mark - UITableViewDelegate.

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellHeight = 0;
    if (indexPath.section == 0) {
        cellHeight = 44.0;
    } else {
        cellHeight = 80.0;
    }
    return cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 如果选中不同 cell 的动作不一致，则需要使用判断执行对应的操作
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {

        } else {

        }
    } else {

    }
}


#pragma mark - MCDemoCell2Delegate

- (void)switchStatusChanged {
    NSLog(@"cell2's switch status changed");
}


#pragma mark - Private methods.

- (UITableViewCell *)getCell1 {
    MCDemoCell1 *cell = [[MCDemoCell1 alloc] init];
    cell.contentLabel.text = @"cell1's content";
    cell.headerIconImageView.image = [UIImage imageNamed:@"header_icon"];
    return cell;
}

- (UITableViewCell *)getCell2 {
    MCDemoCell2 *cell = [[MCDemoCell2 alloc] init];
    cell.titleLabel.text = @"cell2";
    cell.contentLabel.text = @"cell2's content";
    cell.rightSwitchButton.on = YES;
    cell.delegate = self;
    return cell;
}

- (UITableViewCell *)getCell3 {
    MCDemoCell3 *cell = [[MCDemoCell3 alloc] init];
    cell.titleLabel.text = @"cell3";
    cell.subTitleLabel.text = @"cell3's subtitle";
    cell.indicateImageView.image = [UIImage imageNamed:@"indicate"];
    return cell;
}

@end
