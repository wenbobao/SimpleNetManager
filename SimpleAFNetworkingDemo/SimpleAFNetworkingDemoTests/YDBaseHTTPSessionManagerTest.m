//
//  YDBaseHTTPSessionManagerTest.m
//  SimpleAFNetworkingDemo
//
//  Created by bob on 16/4/12.
//  Copyright © 2016年 __company__. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YDBaseHTTPSessionManager.h"

@interface YDBaseHTTPSessionManagerTest : XCTestCase

@end

@implementation YDBaseHTTPSessionManagerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    [[YDBaseHTTPSessionManager sharedManager]requestJsonDataWithPath:@"http://news-at.zhihu.com/api/4/news/latest" withParams:nil withMethodType:Get andBlock:^(id data, NSError *error) {
        
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
