//
//  YDNetWorkConst.m
//  wbchat
//
//  Created by bob on 16/2/17.
//  Copyright © 2016年 bob. All rights reserved.
//

typedef NS_ENUM(NSUInteger, NetworkMethod) {
    Get,
    Post,
    Put,
    Delete,
    Head,
    Patch
};

static NSString *const baseURL= @"http://news-at.zhihu.com";

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

