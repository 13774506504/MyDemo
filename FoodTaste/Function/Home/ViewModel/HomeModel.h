//
//  HomeModel.h
//  FoodTaste
//
//  Created by shown on 16/3/29.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *parentId;  // 菜式id

@property (nonatomic, copy) NSString *parentName;   //菜式名称

@property (nonatomic, copy) NSMutableArray *subArr; //子菜单

@property (nonatomic, copy) NSString *changeStr;    //测试git

#pragma mark --- 网络请求
/**
 *  分类标签列表
 */
+ (void)requestLabel:(NSString *)path IP:(NSString *)ip Param:(id)param Success:(void(^)(id json))success Fail:(void(^)(id error))fail;
/**
 *  按标签检索菜谱
 */
+ (void)requestFoodMenu:(NSString *)path IP:(NSString *)ip Param:(id)param Success:(void(^)(id json))success Fail:(void(^)(id error))fail;
///**
// *  按菜名获取菜谱
// */
//+ (void)requestFootName:(NSString *)path IP:(NSString *)ip Param:(id)param Success:(void(^)(id json))success Fail:(void(^)(id error))fail;
@end

/**
 *  子菜单model
 */
@interface SubFootModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *idStr;    //子菜单id

@property (nonatomic, copy) NSString *nameStr;  //子菜单名称

@property (nonatomic, copy) NSString *parentId; // 父菜单id

@end

/**
 *  菜单模型
 */
@interface MenuModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *idStr;    // 菜单id

@property (nonatomic, copy) NSString *titleStr; //标题

@property (nonatomic, copy) NSString *introStr; //介绍

@property (nonatomic, copy) NSString *ingredientsStr;   //材料

@property (nonatomic, copy) NSString *burdenStr;    //配料

@property (nonatomic, copy) NSArray *iconArr;   //图片数组

@property (nonatomic, copy) NSMutableArray *stepsArr;   //步骤数组

@end

/**
 *  步骤Model
 */
@interface stepModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString *imageStr; //图片路径

@property (nonatomic, copy) NSString *stepStr;  //步骤

@end


