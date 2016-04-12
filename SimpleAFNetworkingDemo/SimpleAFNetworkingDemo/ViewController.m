//
//  ViewController.m
//  SimpleAFNetworkingDemo
//
//  Created by bob on 16/4/12.
//  Copyright © 2016年 __company__. All rights reserved.
//

#import "ViewController.h"
#import "YDBaseHTTPOperationManager.h"
#import "YDBaseHTTPSessionManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //test1
//    [[YDBaseHTTPOperationManager sharedManager]requestJsonDataWithPath:@"http://news-at.zhihu.com/api/4/news/latest" withMethodType:Get withParams:nil withHttpheaders:nil andBlock:^(id data, NSError *error) {
//        
//    }];
    //test2
//    [[YDBaseHTTPOperationManager sharedManager]requestJsonDataWithPath:@"http://apis.baidu.com/showapi_open_bus/pic/pic_search?type=1001&page=1" withMethodType:Get withParams:nil withHttpheaders:@{@"apikey":@"7e67e0c7417285470a93ae275abe4917"} andBlock:^(id data, NSError *error) {
//        
//    }];
    //test3
    
    [[YDBaseHTTPSessionManager sharedManager]requestJsonDataWithPath:@"http://apis.baidu.com/showapi_open_bus/pic/pic_search?type=1001&page=1" withMethodType:Get withParams:nil withHttpheaders:@{@"apikey":@"7e67e0c7417285470a93ae275abe4917"} andBlock:^(id data, NSError *error) {
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
