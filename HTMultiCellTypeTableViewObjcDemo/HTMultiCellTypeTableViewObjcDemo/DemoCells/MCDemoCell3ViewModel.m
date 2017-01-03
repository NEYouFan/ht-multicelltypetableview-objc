//
//  MCDemoCell3ViewModel.m
//  MultiCellTypeTableViewOC
//
//  Created by Baitianyu on 8/26/16.
//  Copyright © 2016 HT. All rights reserved.
//

#import "MCDemoCell3ViewModel.h"
#import "MCDemoTableDescribeData.h"

@implementation MCDemoCell3ViewModel

- (instancetype)initWithDescribeData:(MCDemoTableDescribeData *)describeData {
    if (self = [super init]) {
        _title = describeData.title;
        _subTitle = describeData.subTitle;
        _indicateImage = [UIImage imageNamed:describeData.indicateImageName];
    }
    return self;
}

@end
