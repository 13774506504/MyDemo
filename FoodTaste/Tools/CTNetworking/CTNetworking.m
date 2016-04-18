//
//  CTNetworking.m
//  FoodTaste
//
//  Created by shown on 16/3/29.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//  对afnetworking 进行封装

#import "CTNetworking.h"
#import "AFNetworking.h"

@implementation CTNetworking

+ (void)Get:(NSString *)path IP:(NSString *)ip Param:(id)param Success:(void (^)(id))success Fail:(void (^)(id))fail
{
    // path
    NSString *filePath = [NSString stringWithFormat:@"%@%@",ip,path];
    
    // 请求管理器
    AFHTTPRequestOperationManager *mannager = [AFHTTPRequestOperationManager manager];
    
    mannager.requestSerializer = [AFHTTPRequestSerializer serializer];
    mannager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [mannager GET:filePath parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error);
    }];
}

//转字典
+(NSDictionary *)jsonTurnToDictionary:(id)responseObject
{
    //可以直接用 responseObject 也可以使用字符串operation.responseString
    NSString *str=[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    
    //可以对字符串 提前做些处理 比如删除换行符 之类的
    NSData *resData = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
    
    /*
     NSJSONReadingMutableContainers：返回可变容器，NSMutableDictionary或NSMutableArray。
     NSJSONReadingMutableLeaves：返回的JSON对象中字符串的值为NSMutableString
     NSJSONReadingAllowFragments：允许JSON字符串最外层既不是NSArray也不是NSDictionary，但必须是有效的JSON Fragment。例如使用这个选项可以解析 @“123” 这样的字符串。
     NSJSONWritingPrettyPrinted：的意思是将生成的json数据格式化输出，这样可读性高，不设置则输出的json字符串就是一整行。
     */
    NSDictionary* dictResponse = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
    
    
    return dictResponse;
}

@end
