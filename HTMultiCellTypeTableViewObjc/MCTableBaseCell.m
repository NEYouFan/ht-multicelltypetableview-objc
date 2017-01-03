//
//  MCTableBaseCell.m
//  MultiCellTypeTableViewOC
//
//  Created by Baitianyu on 8/26/16.
//  Copyright © 2016 HT. All rights reserved.
//

#import "MCTableBaseCell.h"

static const CGFloat defaultCellHeight = 44.0;

@implementation MCTableBaseCell

#pragma mark - Life cycle.

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(0, defaultCellHeight);
}

@end
