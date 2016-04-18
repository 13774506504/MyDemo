//
//  LabelCollectionViewCell.m
//  FoodTaste
//
//  Created by shown on 16/3/29.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import "LabelCollectionViewCell.h"

@implementation LabelCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.backgroundColor = RGBCOLOR(200, 200, 200);
    
    self.nameLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    self.nameLab.font = [UIFont systemFontOfSize:CTMake(12)];
    self.nameLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.nameLab];
}

@end
