//
//  News.m
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/2.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "News.h"
#import "NetWorkTools.h"

@implementation News

+(instancetype)newsWithDict:(NSDictionary *)dict{
    
    id obj = [[self alloc]init];
    
    NSArray *propertis = @[@"title",@"digest",@"replycount",@"imgsrc"];
    
    for (NSString *key in propertis) {
        
        if (dict[key]!=nil) {
            [obj setValue:dict[key] forKeyPath:key];
        }
    }
    
    return obj;
}

-(NSString *)description{
    
    NSArray *propertis = @[@"title",@"digest",@"replycount",@"imgsrc"];
    
    NSDictionary *dict = [self dictionaryWithValuesForKeys:propertis];
    
    return [NSString stringWithFormat:@"<%@:%p>\n %@",self.class,self,dict];
    
}

+(void)loadNewsListWithURLString:(NSString *)urlstring{
    
    [[NetWorkTools sharedNetWorkTools] GET:urlstring parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        
        NSLog(@"%@",responseObject.keyEnumerator.nextObject);
        
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        
        NSLog(@"%@",array);
        
        NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:array.count];
        
        for (NSDictionary *obj in array) {
            [mutableArray addObject:[self newsWithDict:obj]];
        }
        NSLog(@"%@",mutableArray);
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}



@end
