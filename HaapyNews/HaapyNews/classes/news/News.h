//
//  News.h
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/2.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *digest;

@property (nonatomic,assign) int replycount;

@property (nonatomic,copy) NSString *imgsrc;

+(instancetype)newsWithDict:(NSDictionary *)dict;

+(void)loadNewsListWithURLString:(NSString *)urlstring;

@end
