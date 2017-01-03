//
//  MCDemoCell2.h
//  MultiCellTypeTableViewOC
//
//  Created by Baitianyu on 8/26/16.
//  Copyright © 2016 HT. All rights reserved.
//

#import "MCTableBaseCell.h"

@protocol MCDemoCell2Delegate <NSObject>

@optional
- (void)switchStatusChanged;

@end

@interface MCDemoCell2 : MCTableBaseCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UISwitch *rightSwitchButton;
@property (nonatomic, weak) id<MCDemoCell2Delegate> delegate;

@end
