//
//  NetWorkTools.h
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/1.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetWorkTools : AFHTTPSessionManager

//全局入口
+(instancetype)sharedNetWorkTools;

@end
