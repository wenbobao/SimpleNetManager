//
//  YDBaseHTTPSessionManager.h
//  wbchat
//
//  Created by bob on 16/2/17.
//  Copyright © 2016年 bob. All rights reserved.
//

#import <AFNetworking/AFHTTPSessionManager.h>
#import "YDNetWorkConst.h"

@interface YDBaseHTTPSessionManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

- (void)requestJsonDataWithPath:(NSString *)aPath
                 withMethodType:(NetworkMethod)method
                     withParams:(NSDictionary *)params
                withHttpheaders:(NSDictionary *)headers
                       andBlock:(void (^)(id data, NSError *error))block;

@end
