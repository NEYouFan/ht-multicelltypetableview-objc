//
//  MCDemoTableDescribeData.h
//  MultiCellTypeTableViewOC
//
//  Created by Baitianyu on 10/10/2016.
//  Copyright © 2016 HT. All rights reserved.
//

#import "MCTableBaseDescribeData.h"
#import "MCDemoCell2.h"

@interface MCDemoTableDescribeData : MCTableBaseDescribeData

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, assign) BOOL switchStatus;
@property (nonatomic, copy) NSString *indicateImageName;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *headerIconName;
@property (nonatomic, weak) id<MCDemoCell2Delegate> cell2Delegate;

@end
