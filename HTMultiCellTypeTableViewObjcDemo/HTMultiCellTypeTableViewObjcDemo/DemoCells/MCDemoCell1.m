//
//  MCDemoCell1.m
//  MultiCellTypeTableViewOC
//
//  Created by Baitianyu on 8/26/16.
//  Copyright © 2016 HT. All rights reserved.
//

#import "MCDemoCell1.h"
#import "MCDemoTableDescribeData.h"
#import "UIView+MCLine.h"
#import "Masonry.h"

@implementation MCDemoCell1

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
    _headerIconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_headerIconImageView];
    [_headerIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(10);
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(@25);
        make.height.equalTo(@25);
    }];
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.textColor = [UIColor blackColor];
    _contentLabel.font = [UIFont systemFontOfSize:15];
    _contentLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@120);
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).with.offset(-10);
        make.height.equalTo(@15);
    }];
}


#pragma mark - Getter & Setter.

- (void)setDescribeData:(MCTableBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:MCDemoTableDescribeData.class]) {
        MCDemoTableDescribeData *data = (MCDemoTableDescribeData *)describeData;
        _headerIconImageView.image = [UIImage imageNamed:data.headerIconName];
        _contentLabel.text = data.content;
        // [self setNeedsLayout]; // 如果使用的是 frame 布局，这里需要更新布局
    }
}

@end
