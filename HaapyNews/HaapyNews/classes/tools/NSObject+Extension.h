//
//  NSObject+Extension.h
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/7.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

/**
 *  字典转模型
 */
+(instancetype)objectWithDict:(NSDictionary *)dict;
/**
 *  加载类的属性数组
 */
+(NSArray *)loadProperties;
@end
