//
//  CTNetworking.h
//  FoodTaste
//
//  Created by shown on 16/3/29.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTNetworking : NSObject

+ (void)Get:(NSString *)path IP:(NSString *)ip Param:(id)param Success:(void(^)(id json))success Fail:(void(^)(id error))fail;

+(NSDictionary *)jsonTurnToDictionary:(id)responseObject;

@end
