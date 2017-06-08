//
//  MCTableBaseDescribeData.m
//  MultiCellTypeTableViewOC
//
//  Created by Baitianyu on 8/26/16.
//  Copyright © 2016 HT. All rights reserved.
//

#import "MCTableBaseDescribeData.h"
#import "MCTableBaseCell.h"

@interface MCTableBaseDescribeData ()

@property (nonatomic, weak) MCTableBaseCell *cell;

@end

@implementation MCTableBaseDescribeData

- (instancetype)init {
    if (self = [super init]) {
        _customCellBlock = [self defaultCustomCellBlock];
    }
    
    return self;
}

- (CustomCellBlock)defaultCustomCellBlock {
    __weak typeof(self) wkSelf = self;
    return ^(MCTableBaseCell *cell, MCTableBaseDescribeData *describeData) {
        __strong typeof(self) sgSelf = wkSelf;
        sgSelf.cell = cell;
        cell.describeData = describeData;
    };
}

- (CGFloat)cellHeight {
    return [_cell sizeThatFits:CGSizeZero].height;
}

@end
