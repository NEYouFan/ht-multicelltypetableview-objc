//
//  UIView+MCLine.m
//  MultiCellTypeTableViewOC
//
//  Created by Baitianyu on 8/25/16.
//  Copyright © 2016 HT. All rights reserved.
//

#import "UIView+MCLine.h"
#import <objc/runtime.h>
#import "Masonry.h"

static char const *kBottomLineKey;

@implementation UIView (MCLine)

#pragma mark - Class methods.

+ (instancetype)mc_line {
    UIView *line = [[UIView alloc] init];
    line.frame = CGRectMake(0, 0, 1.0/[UIScreen mainScreen].scale, 1.0/[UIScreen mainScreen].scale);
    line.backgroundColor = [UIColor lightGrayColor];
    return line;
}


#pragma mark - Public methods.

- (UIView *)mc_addBottomLineWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin {
    UIView *line = [self yws_getCellLineByKey:&kBottomLineKey];
    [line removeFromSuperview];
    [self addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.equalTo(self).with.offset(leftMargin);
        make.right.equalTo(self).with.offset(-rightMargin);
        make.height.equalTo(@(1.0/[UIScreen mainScreen].scale));
    }];
    
    return line;
}


#pragma mark - Private methods.

- (UIView *)yws_getCellLineByKey:(void *)key {
    UIView *line = objc_getAssociatedObject(self, key);
    if (!line) {
        line = [UIView mc_line];
        objc_setAssociatedObject(self, key, line, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return line;
}

@end
