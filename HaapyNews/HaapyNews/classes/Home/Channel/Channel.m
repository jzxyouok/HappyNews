//
//  Channel.m
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/7.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "Channel.h"
#import "NSObject+Extension.h"
@implementation Channel

// 重写 setter 方法，意味着对象的引用处理，全部由程序员接管
// 重写 copy 属性，在设置数值的时候，一定要写 copy！
- (void)setTid:(NSString *)tid {
    // 如果不使用 copy，外面的 copy 就白写了
    // *** 设置数值，tid 属性只是一个 strong，而不是 copy
    _tid = tid.copy;
    
    _urlString = [NSString stringWithFormat:@"%@/0-40.html", _tid];
}

// 模型的特点，越重要的频道，`tid 越小`

+(NSArray *)channelList{
    /**
     *  加载 json 的二进制数据
     */
    NSString *path = [[NSBundle mainBundle]pathForResource:@"topic_news" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    /**
     *  反序列化
     */
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    /**
     *  从字典中获取数组
     */
    NSArray *array = dict[dict.keyEnumerator.nextObject];
    /**
     *  遍历数组,字典转模型
     */
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self objectWithDict:dict]];
    }
    
#warning TODO
    // 5. 针对 tid 做一个排序
    return [arrayM sortedArrayUsingComparator:^NSComparisonResult(Channel *obj1, Channel *obj2) {
        
        return [obj1.tid compare:obj2.tid];
    }];

}

@end
