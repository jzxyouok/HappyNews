//
//  NetWorkTools.m
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/1.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "NetWorkTools.h"

@implementation NetWorkTools

+(instancetype)sharedNetWorkTools{
   
    static NetWorkTools * instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/"];
        instance = [[self alloc]initWithBaseURL:url];
        
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    return instance;
}

@end
