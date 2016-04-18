//
//  FootDetailHeadView.m
//  FoodTaste
//
//  Created by shown on 16/3/29.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import "FootDetailHeadView.h"

@implementation FootDetailHeadView

- (instancetype)initWithFrame:(CGRect)frame Model:(MenuModel *)model
{
    if (self = [super initWithFrame:frame])
    {
        self.model = model;
        
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.titleLab = [[UILabel alloc] init];
    self.titleLab.font = [UIFont systemFontOfSize:CTMake(16)];
    self.titleLab.text = _model.titleStr;
    self.titleLab.textColor = [UIColor whiteColor];
    CGSize size = [DefinitionFile getTextMultilineContent:_titleLab.text withFont:_titleLab.font withSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT)];
    self.titleLab.frame = CGRectMake(SCREEN_WIDTH/2. - size.width/2., CTMake(12), size.width, size.height);
    [self addSubview:self.titleLab];
    
    //介绍
    self.introLab = [[UILabel alloc] init];
    self.introLab.font = [UIFont systemFontOfSize:CTMake(14)];
    self.introLab.textColor = RGBCOLOR(200, 200, 200);
    self.introLab.text = _model.introStr;
    self.introLab.numberOfLines = 0;
    size = [DefinitionFile getTextMultilineContent:_introLab.text withFont:_introLab.font withSize:CGSizeMake(SCREEN_WIDTH - CTMake(24), MAXFLOAT)];
    self.introLab.frame = CGRectMake(CTMake(12), _titleLab.bottom + CTMake(12), size.width, size.height);
    [self addSubview:self.introLab];
    
    self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(CTMake(12), _introLab.bottom + CTMake(12), SCREEN_WIDTH - CTMake(24), CTMake(200))];
    self.iconView.clipsToBounds = YES;
    self.iconView.contentMode = UIViewContentModeScaleAspectFill;
    [self.iconView sd_setImageWithURL:_model.iconArr[0] placeholderImage:nil];
    [self addSubview:self.iconView];
    
    //材料
    self.ingredientsLab = [[UILabel alloc] init];
    self.ingredientsLab.font = [UIFont systemFontOfSize:CTMake(12)];
    self.ingredientsLab.textColor = RGBCOLOR(200, 200, 200);
    self.ingredientsLab.text = _model.ingredientsStr;
    self.ingredientsLab.numberOfLines = 0;
    size = [DefinitionFile getTextMultilineContent:_ingredientsLab.text withFont:_ingredientsLab.font withSize:CGSizeMake(SCREEN_WIDTH - CTMake(24), MAXFLOAT)];
    self.ingredientsLab.frame = CGRectMake(CTMake(12), _iconView.bottom + CTMake(12), size.width, size.height);
    [self addSubview:self.ingredientsLab];
    
    //配料
    self.burdenLab = [[UILabel alloc] init];
    self.burdenLab.font = [UIFont systemFontOfSize:CTMake(12)];
    self.burdenLab.textColor = RGBCOLOR(200, 200, 200);
    self.burdenLab.text = _model.burdenStr;
    self.burdenLab.numberOfLines = 0;
    size = [DefinitionFile getTextMultilineContent:_burdenLab.text withFont:_burdenLab.font withSize:CGSizeMake(SCREEN_WIDTH - CTMake(24), MAXFLOAT)];
    self.burdenLab.frame = CGRectMake(CTMake(12), _ingredientsLab.bottom + CTMake(12), size.width, size.height);
    [self addSubview:self.burdenLab];
    
    //步骤
    self.lab = [[UILabel alloc] init];
    self.lab.font = [UIFont systemFontOfSize:CTMake(14)];
    self.lab.textColor = RGBCOLOR(200, 200, 200);
    self.lab.text = @"步骤:";
    size = [DefinitionFile getTextMultilineContent:_lab.text withFont:_lab.font withSize:CGSizeMake(SCREEN_WIDTH - CTMake(24), MAXFLOAT)];
    self.lab.frame = CGRectMake(CTMake(12), _burdenLab.bottom + CTMake(12), size.width, size.height);
    [self addSubview:self.lab];
    
    UIImageView *iconView = nil;
    UILabel *lab = nil;
    CGFloat top = _lab.bottom + CTMake(20);
    for (int i = 0; i < _model.stepsArr.count; i++)
    {
        stepModel *model = _model.stepsArr[i];
        
        lab = [[UILabel alloc] init];
        lab.font = [UIFont systemFontOfSize:CTMake(13)];
        lab.text = model.stepStr;
        lab.textColor =  RGBCOLOR(200, 200, 200);
        lab.numberOfLines = 0;
        size = [DefinitionFile getTextMultilineContent:lab.text withFont:lab.font withSize:CGSizeMake(SCREEN_WIDTH - CTMake(120), MAXFLOAT)];
        lab.frame = CGRectMake(CTMake(60), top, size.width, size.height);
        [self addSubview:lab];
        
        iconView = [[UIImageView alloc] initWithFrame:CGRectMake(CTMake(60), lab.bottom + CTMake(5), CTMake(255), CTMake(150))];
        [iconView sd_setImageWithURL:[NSURL URLWithString:model.imageStr] placeholderImage:nil];
        iconView.clipsToBounds = YES;
        iconView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:iconView];
        
        top = iconView.bottom + CTMake(12);
    }
    
    self.height = iconView.bottom + CTMake(20);
}

@end
