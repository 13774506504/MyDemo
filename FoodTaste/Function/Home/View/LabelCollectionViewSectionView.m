//
//  LabelCollectionViewSectionView.m
//  FoodTaste
//
//  Created by shown on 16/3/29.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import "LabelCollectionViewSectionView.h"

@implementation LabelCollectionViewSectionView

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
    _titleLab = [[UILabel alloc] initWithFrame:self.bounds];
    _titleLab.font = [UIFont systemFontOfSize:CTMake(15)];
    _titleLab.textColor = RGBCOLOR16(0x666666);
    _titleLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLab];
}

@end
