//
//  HomeTableViewCell.m
//  FoodTaste
//
//  Created by shown on 16/3/29.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(CTMake(12), CTMake(12), CTMake(120), CTMake(80))];
    self.iconView.layer.cornerRadius = CTMake(5);
    self.iconView.layer.masksToBounds = YES;
    self.iconView.contentMode = UIViewContentModeScaleAspectFill;
    self.iconView.clipsToBounds = YES;
    self.iconView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:self.iconView];
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(_iconView.right + CTMake(12), _iconView.top, SCREEN_WIDTH - _iconView.right - CTMake(24), CTMake(30))];
    self.titleLab.font = [UIFont systemFontOfSize:CTMake(15)];
    self.titleLab.textColor = [UIColor whiteColor];
    self.titleLab.text = @"这是标题";
    [self.contentView addSubview:self.titleLab];
    
    self.introLab = [[UILabel alloc] initWithFrame:CGRectMake(_titleLab.left, _titleLab.bottom, _titleLab.width, CTMake(50))];
    self.introLab.font = [UIFont systemFontOfSize:CTMake(12)];
    self.introLab.textColor = [UIColor whiteColor];
    self.introLab.text = @"介绍";
    self.introLab.numberOfLines = 0;
    [self.contentView addSubview:self.introLab];
}

- (void)refreshDataWith:(MenuModel *)model
{
    if (model.iconArr.count > 0) {
        [_iconView sd_setImageWithURL:[NSURL URLWithString:model.iconArr[0]] placeholderImage:nil];
    }
    
    _titleLab.text = model.titleStr;
    
    _introLab.text = model.introStr;
}


@end
