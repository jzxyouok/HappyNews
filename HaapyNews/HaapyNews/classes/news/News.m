//
//  News.m
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/2.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "News.h"
#import "NetWorkTools.h"
#import <objc/runtime.h>
#import "NSObject+Extension.h"

@implementation News

-(NSString *)description{
    
    NSArray *propertis = @[@"title",@"digest",@"replycount",@"imgsrc"];
    
    NSDictionary *dict = [self dictionaryWithValuesForKeys:propertis];
    
    return [NSString stringWithFormat:@"<%@:%p>\n %@",self.class,self,dict];
    
}

+(void)loadNewsListWithURLString:(NSString *)urlstring finished:(void (^)(NSArray *))finished{
    NSAssert(finished !=nil, @"必须传入完成回调");
    [[NetWorkTools sharedNetWorkTools] GET:urlstring parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        
        //NSLog(@"%@",responseObject.keyEnumerator.nextObject);
        
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        
        //NSLog(@"%@",array);
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        
        for (NSDictionary *obj in array) {
            [arrayM addObject:[self objectWithDict:obj]];
        }
        //NSLog(@"%@",mutableArray);
        //直接回调
        finished(arrayM.copy);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}



@end
