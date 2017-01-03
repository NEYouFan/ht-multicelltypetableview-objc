//
//  MCDemoCell3ViewModel.h
//  MultiCellTypeTableViewOC
//
//  Created by Baitianyu on 8/26/16.
//  Copyright © 2016 HT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MCDemoTableDescribeData;

@interface MCDemoCell3ViewModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, strong) UIImage *indicateImage;

- (instancetype)initWithDescribeData:(MCDemoTableDescribeData *)describeData;

@end
