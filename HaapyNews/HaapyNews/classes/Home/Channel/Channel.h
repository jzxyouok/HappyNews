//
//  Channel.h
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/7.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Channel : NSObject

@property (nonatomic,copy) NSString *tname;

@property (nonatomic,copy) NSString *tid;

// 只能内部修改，外部只读
@property (nonatomic, strong, readonly) NSString *urlString;

/**
 *  加载所有频道的数组
 */
+(NSArray *)channelList;
@end
