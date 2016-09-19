//
//  YDHttpClient.h
//  wbchat
//
//  Created by bob on 15/9/6.
//  Copyright (c) 2015年 bob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDHttpClient : NSObject

+ (instancetype)sharedClient;

- (void)login_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;

@end
