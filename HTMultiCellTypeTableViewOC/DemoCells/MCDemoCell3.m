//
//  MCDemoCell3.m
//  MultiCellTypeTableViewOC
//
//  Created by Baitianyu on 8/26/16.
//  Copyright © 2016 HT. All rights reserved.
//

#import "MCDemoCell3.h"
#import "MCDemoCell3ViewModel.h"
#import "MCDemoTableDescribeData.h"
#import "UIView+MCLine.h"

static const CGFloat cell3Height = 80;

@implementation MCDemoCell3

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
    _indicateImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_indicateImageView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor redColor];
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_titleLabel];

    _subTitleLabel = [[UILabel alloc] init];
    _subTitleLabel.textColor = [UIColor blueColor];
    _subTitleLabel.font = [UIFont systemFontOfSize:10];
    _subTitleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_subTitleLabel];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _titleLabel.frame = CGRectMake(10, 15, 100, 18);
    _subTitleLabel.frame = CGRectMake(10, 40, 100, 11);
    _indicateImageView.frame = CGRectMake(150, 10, 33, 33);
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(0, cell3Height);
}


#pragma mark - Getter & Setter.

- (void)setDescribeData:(MCTableBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:MCDemoTableDescribeData.class]) {
        MCDemoCell3ViewModel *viewModel = [[MCDemoCell3ViewModel alloc] initWithDescribeData:(MCDemoTableDescribeData *)describeData];
        self.viewModel = viewModel;
    }
}

- (void)setViewModel:(MCDemoCell3ViewModel *)viewModel {
    if (_viewModel == viewModel) {
        return;
    }
    
    _viewModel = viewModel;
    _titleLabel.text = _viewModel.title;
    _subTitleLabel.text = _viewModel.subTitle;
    _indicateImageView.image = _viewModel.indicateImage;
}

@end
