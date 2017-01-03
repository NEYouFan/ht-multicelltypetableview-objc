//
//  MCDemoCell3.h
//  MultiCellTypeTableViewOC
//
//  Created by Baitianyu on 8/26/16.
//  Copyright © 2016 HT. All rights reserved.
//

#import "MCTableBaseCell.h"

@class MCDemoCell3ViewModel;

@interface MCDemoCell3 : MCTableBaseCell

@property (nonatomic, strong) UIImageView *indicateImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;

@property (nonatomic, strong) MCDemoCell3ViewModel *viewModel;

@end
