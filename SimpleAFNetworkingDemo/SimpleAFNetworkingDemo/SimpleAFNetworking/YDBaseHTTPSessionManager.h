//
//  YDBaseHTTPSessionManager.h
//  wbchat
//
//  Created by bob on 16/2/17.
//  Copyright © 2016年 bob. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "YDNetWorkConst.h"

@interface YDBaseHTTPSessionManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                       andBlock:(void (^)(id data, NSError *error))block;

@end
