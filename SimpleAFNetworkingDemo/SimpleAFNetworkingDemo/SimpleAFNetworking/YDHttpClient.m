//
//  YDHttpClient.m
//  wbchat
//
//  Created by bob on 15/9/6.
//  Copyright (c) 2015年 bob. All rights reserved.
//

#import "YDHttpClient.h"
#import "YDBaseHTTPOperationManager.h"

@implementation YDHttpClient

+ (instancetype)sharedClient {
    static YDHttpClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[YDHttpClient alloc] init];
    });
    return _sharedClient;
}

- (NSDictionary *)parameters {
    NSMutableDictionary *_common = [NSMutableDictionary dictionary];
    NSString *currentVersion= [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    _common[@"version"] = currentVersion;
    return _common.copy;
}

- (void)login_WithParams:(id)params andBlock:(void (^)(id data, NSError *error))block{
    NSString *path = @"user_login.action";
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [parameters addEntriesFromDictionary:[self parameters]];
    [[YDBaseHTTPOperationManager sharedManager] requestJsonDataWithPath:path withParams:parameters withMethodType:Post andBlock:^(id data, NSError *error) {
        id JSON = [NSJSONSerialization JSONObjectWithData:data
                                                  options:NSJSONReadingAllowFragments error:nil];
        if ([[JSON objectForKey:@"data"] isKindOfClass:[NSDictionary class]]) {
            block(JSON[@"data"], nil);
        }else{
            block(nil,error);
        }
    }];
}

@end
