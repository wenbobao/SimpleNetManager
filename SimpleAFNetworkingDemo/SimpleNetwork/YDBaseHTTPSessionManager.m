//
//  YDBaseHTTPSessionManager.m
//  wbchat
//
//  Created by bob on 16/2/17.
//  Copyright © 2016年 bob. All rights reserved.
//

#import "YDBaseHTTPSessionManager.h"

@implementation YDBaseHTTPSessionManager

+ (instancetype)sharedManager {
    static YDBaseHTTPSessionManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[YDBaseHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
    });
    return _sharedManager;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/application",@"text/html", nil];
    
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    [self.requestSerializer setValue:@"XMLHttpRequest" forHTTPHeaderField:@"X-Requested-With"];
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [self.requestSerializer setValue:url.absoluteString forHTTPHeaderField:@"Referer"];
    
    self.securityPolicy.allowInvalidCertificates = YES;
    
    return self;
}

- (void)requestJsonDataWithPath:(NSString *)aPath
                 withMethodType:(NetworkMethod)method
                     withParams:(NSDictionary *)params
                withHttpheaders:(NSDictionary *)headers
                       andBlock:(void (^)(id data, NSError *error))block
{
    
    if (!aPath || aPath.length <= 0) {
        return;
    }
    aPath = [aPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    if (headers != nil) {
        for (id httpHeaderField in headers.allKeys) {
            id value = headers[httpHeaderField];
            if ([httpHeaderField isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
                [self.requestSerializer setValue:(NSString *)value forHTTPHeaderField:(NSString *)httpHeaderField];
            } else {
                DLog(@"Error, class of key/value in headerFieldValueDictionary should be NSString.");
            }
        }
    }
    
    //发起请求
    switch (method) {
        case Get:{
            [self GET:aPath parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
                DLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
                block(responseObject, nil);
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                DLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                block(nil, error);
            }];
            break;
        }
        case Post:{
            [self POST:aPath parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
                DLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
                block(responseObject, nil);
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                DLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                block(nil, error);
            }];
            break;
        }
        case Put:{
            [self PUT:aPath parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
                DLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
                block(responseObject, nil);
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                DLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                block(nil, error);
            }];
            break;
        }
        case Delete:{
            [self DELETE:aPath parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
                DLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
                block(responseObject, nil);
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                DLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                block(nil, error);
            }];
            break;
        }
        case Head:{
            [self HEAD:aPath parameters:params success:^(NSURLSessionDataTask *task) {
                DLog(@"\n===========response===========\n%@:\n%@", aPath, task.response);
                block(task.response, nil);
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                DLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                block(nil, error);
            }];
            break;
        }
        case Patch:{
            [self PATCH:aPath parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
                DLog(@"\n===========response===========\n%@:\n%@", aPath, responseObject);
                block(responseObject, nil);
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                DLog(@"\n===========response===========\n%@:\n%@", aPath, error);
                block(nil, error);
            }];
            break;
        }
        default:
            break;
    }
}


@end
