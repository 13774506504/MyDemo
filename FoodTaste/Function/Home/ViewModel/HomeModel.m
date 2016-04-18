//
//  HomeModel.m
//  FoodTaste
//
//  Created by shown on 16/3/29.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        self.parentId = [aDecoder decodeObjectForKey:@"parentId"];
        self.parentName = [aDecoder decodeObjectForKey:@"parentName"];
        self.subArr = [aDecoder decodeObjectForKey:@"subArr"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.parentId forKey:@"parentId"];
    [aCoder encodeObject:self.parentName forKey:@"parentName"];
    [aCoder encodeObject:self.subArr forKey:@"subArr"];
}

+ (void)requestLabel:(NSString *)path IP:(NSString *)ip Param:(id)param Success:(void (^)(id))success Fail:(void (^)(id))fail
{
    [CTNetworking Get:path IP:ip Param:param Success:^(id json) {
        NSDictionary *dict = [CTNetworking jsonTurnToDictionary:json];
        
        NSMutableArray *tempArr = [NSMutableArray array];
        
        NSArray *array = dict[@"result"];
        if (array.count > 0)
        {
            for (NSDictionary *dic in array)
            {
                HomeModel *model = [[HomeModel alloc] init];
                model.parentId = [NSString stringWithFormat:@"%@",dic[@"parentId"]];
                model.parentName = [NSString stringWithFormat:@"%@",dic[@"name"]];
                
                NSMutableArray *subArr = [NSMutableArray array];
                
                NSArray *subArray = dic[@"list"];
                for (NSDictionary *subDic in subArray)
                {
                    SubFootModel *subModel = [[SubFootModel alloc] init];
                    subModel.idStr = [NSString stringWithFormat:@"%@",subDic[@"id"]];
                    subModel.nameStr = [NSString stringWithFormat:@"%@",subDic[@"name"]];
                    subModel.parentId = [NSString stringWithFormat:@"%@",subDic[@"parentId"]];
                    [subArr addObject:subModel];
                }
                model.subArr = subArr;
                
                [tempArr addObject:model];
            }
        }
        
        success(tempArr);
    } Fail:^(id error) {
        fail(error);
    }];
}

+ (void)requestFoodMenu:(NSString *)path IP:(NSString *)ip Param:(id)param Success:(void (^)(id))success Fail:(void (^)(id))fail
{
    [CTNetworking Get:path IP:ip Param:param Success:^(id json) {
        NSDictionary *dict = [CTNetworking jsonTurnToDictionary:json];
        
        NSMutableArray *tempArr = [NSMutableArray array];
        
        NSArray *array = dict[@"result"][@"data"];
        if (array.count > 0)
        {
            for (NSDictionary *dic in array)
            {
                MenuModel *model = [[MenuModel alloc] init];
                model.idStr = [NSString stringWithFormat:@"%@",dic[@"id"]];
                model.titleStr = [NSString stringWithFormat:@"%@",dic[@"title"]];
                model.introStr = [NSString stringWithFormat:@"%@",dic[@"imtro"]];
                model.ingredientsStr = [NSString stringWithFormat:@"%@",dic[@"ingredients"]];
                model.burdenStr = [NSString stringWithFormat:@"%@",dic[@"burden"]];
                model.iconArr = dic[@"albums"];
                
                NSMutableArray *subArr = [NSMutableArray array];
                
                NSArray *subArray = dic[@"steps"];
                for (NSDictionary *subDic in subArray)
                {
                    stepModel *subModel = [[stepModel alloc] init];
                    subModel.imageStr = [NSString stringWithFormat:@"%@",subDic[@"img"]];
                    subModel.stepStr = [NSString stringWithFormat:@"%@",subDic[@"step"]];
                    [subArr addObject:subModel];
                }
                model.stepsArr = subArr;
                
                [tempArr addObject:model];
            }
        }
        success(tempArr);
    } Fail:^(id error) {
        fail(error);
    }];
}

@end

/**
 *  子菜单model
 */
@implementation SubFootModel

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        self.idStr = [aDecoder decodeObjectForKey:@"idStr"];
        self.nameStr = [aDecoder decodeObjectForKey:@"nameStr"];
        self.parentId = [aDecoder decodeObjectForKey:@"parentId"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.idStr forKey:@"idStr"];
    [aCoder encodeObject:self.nameStr forKey:@"nameStr"];
    [aCoder encodeObject:self.parentId forKey:@"parentId"];
}

@end

/**
 *  菜单模型
 */
@implementation MenuModel

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        self.idStr = [aDecoder decodeObjectForKey:@"idStr"];
        self.titleStr = [aDecoder decodeObjectForKey:@"titleStr"];
        self.introStr = [aDecoder decodeObjectForKey:@"introStr"];
        self.ingredientsStr = [aDecoder decodeObjectForKey:@"ingredientsStr"];
        self.burdenStr = [aDecoder decodeObjectForKey:@"burdenStr"];
        self.iconArr = [aDecoder decodeObjectForKey:@"iconArr"];
        self.stepsArr = [aDecoder decodeObjectForKey:@"stepsArr"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.idStr forKey:@"idStr"];
    [aCoder encodeObject:self.titleStr forKey:@"titleStr"];
    [aCoder encodeObject:self.introStr forKey:@"introStr"];
    [aCoder encodeObject:self.ingredientsStr forKey:@"ingredientsStr"];
    [aCoder encodeObject:self.burdenStr forKey:@"burdenStr"];
    [aCoder encodeObject:self.iconArr forKey:@"iconArr"];
    [aCoder encodeObject:self.stepsArr forKey:@"stepsArr"];
}

@end

/**
 *  步骤Model
 */
@implementation stepModel

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        self.imageStr = [aDecoder decodeObjectForKey:@"imageStr"];
        self.stepStr = [aDecoder decodeObjectForKey:@"stepStr"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.imageStr forKey:@"imageStr"];
    [aCoder encodeObject:self.stepStr forKey:@"stepStr"];
}

@end
