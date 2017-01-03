//
//  MCDemoCell2.m
//  MultiCellTypeTableViewOC
//
//  Created by Baitianyu on 8/26/16.
//  Copyright © 2016 HT. All rights reserved.
//

#import "MCDemoCell2.h"
#import "MCDemoTableDescribeData.h"
#import "UIView+MCLine.h"
#import "Masonry.h"

@implementation MCDemoCell2

#pragma mark - Life cycle.

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubviews];
    }
    return self;
}


#pragma mark - Load views.

- (void)loadSubviews {
    [self.contentView mc_addBottomLineWithLeftMargin:0 rightMargin:0];

    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor redColor];
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(10);
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(@80);
        make.height.equalTo(@18);
    }];
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.textColor = [UIColor blackColor];
    _contentLabel.font = [UIFont systemFontOfSize:15];
    _contentLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(@120);
        make.right.equalTo(self.contentView).with.offset(-10);
        make.height.equalTo(@15);
    }];
    
    _rightSwitchButton = [[UISwitch alloc] init];
    [_rightSwitchButton addTarget:self action:@selector(switchStatusChanged) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_rightSwitchButton];
    [_rightSwitchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).with.offset(-10);
    }];
}


#pragma mark - Getter & Setter.

- (void)setDescribeData:(MCTableBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:MCDemoTableDescribeData.class]) {
        MCDemoTableDescribeData *data = (MCDemoTableDescribeData *)describeData;
        _titleLabel.text = data.title;
        _contentLabel.text = data.content;
        _rightSwitchButton.on = data.switchStatus;
        _delegate = data.cell2Delegate;
    }
}


#pragma mark - Actions.

- (void)switchStatusChanged {
    [_delegate switchStatusChanged];
}

@end
