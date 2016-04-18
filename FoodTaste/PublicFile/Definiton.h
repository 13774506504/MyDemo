//
//  Definiton.h
//  FoodTaste
//
//  Created by shown on 16/3/28.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#ifndef Definiton_h
#define Definiton_h

//屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define CTMake(x) [DefinitionFile adapterWithIphone6:x]

#define kScreenSize           [[UIScreen mainScreen] bounds].size
#define kScreenWidth          [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight         [[UIScreen mainScreen] bounds].size.height

#define kMainPageDistance   CTMake(100)   //打开左侧窗时，中视图(右视图)露出的宽度
#define kMainPageScale   0.8  //打开左侧窗时，中视图(右视图）缩放比例
#define kMainPageCenter  CGPointMake(kScreenWidth + kScreenWidth * kMainPageScale / 2.0 - kMainPageDistance, kScreenHeight / 2)  //打开左侧窗时，中视图中心点

#define vCouldChangeDeckStateDistance  (kScreenWidth - kMainPageDistance) / 2.0 - CTMake(40) //滑动距离大于此数时，状态改变（关--》开，或者开--》关）
#define vSpeedFloat   0.7    //滑动速度

#define kLeftAlpha 0.9  //左侧蒙版的最大值
#define kLeftCenterX CTMake(30) //左侧初始偏移量
#define kLeftScale 0.7 //左侧初始缩放比例

#define vDeckCanNotPanViewTag    987654   // 不响应此侧滑的View的tag

#define STAR_Y ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] == NSOrderedAscending ? 44 : 64)

/**
 *
 * 颜色相关  *****************************************************************************************
 */
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGBCOLOR16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBACOLOR16(rgbValue) [UIColor colorWithRed:((float)(((rgbValue & 0xFF000000) >> 16) >>8))/255.0 green:((float)((rgbValue & 0xFF0000) >> 16))/255.0 blue:((float)((rgbValue & 0xFF00)>>8))/255.0 alpha:(float)(rgbValue & 0xFF)/255.0]
#define colorFrom16RGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#pragma mark 接口

#define AppKey @"76ef10ba14360adab2205ada2d91238d"

#define FoodIP @"http://apis.juhe.cn/cook"

/**
 分类标签
 */
#define Food_category @"/category"

/**
 菜谱大全
 */
#define Food_query @"/query.php"

/**
 按标签检索菜谱
 */
#define Food_index @"/index"

/**
 按菜谱ID查看详细
 */
#define Food_queryid @"/queryid"

#endif /* Definiton_h */
