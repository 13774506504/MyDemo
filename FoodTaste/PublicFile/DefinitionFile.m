//
//  DefinitionFile.m
//  FoodTaste
//
//  Created by shown on 16/3/28.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import "DefinitionFile.h"

@implementation DefinitionFile

+ (CGFloat)adapterWithIphone6:(CGFloat)x
{
    if (SCREEN_WIDTH == 375) {
        return x;
    }
    return x * SCREEN_WIDTH / 375;
}

/**
 *  获取字体的大小范围
 *  多行显示
 */
+(CGSize)getTextMultilineContent:(NSString*)text withFont:(UIFont*)font withSize:(CGSize)size
{
    CGSize mSize = [text boundingRectWithSize:size
                                      options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                   attributes:@{NSFontAttributeName:font}
                                      context:nil].size;
    return mSize;
}

@end
