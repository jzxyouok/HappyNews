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

@property (nonatomic,assign) int replyCount;

@property (nonatomic,copy) NSString *imgsrc;
/**
 *  多图数组
 */
@property (nonatomic,strong) NSArray *imgextra;
/**
 *  是否大图标记
 */
@property (nonatomic,assign,getter=isBigImage) BOOL imageType;

+(instancetype)newsWithDict:(NSDictionary *)dict;

+(void)loadNewsListWithURLString:(NSString *)urlstring finished:(void (^)(NSArray *))finished;

@end
