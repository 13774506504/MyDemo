//
//  DefinitionFile.h
//  FoodTaste
//
//  Created by shown on 16/3/28.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DefinitionFile : NSObject

/**
 *  以6的尺寸做适配
 *
 *  @param x 适配前的值
 *
 *  @return 适配后的值
 */
+ (CGFloat)adapterWithIphone6:(CGFloat)x;

+(CGSize)getTextMultilineContent:(NSString*)text withFont:(UIFont*)font withSize:(CGSize)size;

@end
