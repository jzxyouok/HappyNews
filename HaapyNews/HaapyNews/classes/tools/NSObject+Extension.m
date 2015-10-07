//
//  NSObject+Extension.m
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/7.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)

+(instancetype)objectWithDict:(NSDictionary *)dict{
    
    id obj = [[self alloc]init];
    
    //    NSArray *propertis = @[@"title",@"digest",@"replycount",@"imgsrc"];
    
    NSArray *properties = [self loadProperties];
    
    for (NSString *key in properties) {
        
        if (dict[key]!=nil) {
            [obj setValue:dict[key] forKeyPath:key];
        }
    }
    
    return obj;
}

//动态加载类的属性
const char *kpropertieskey = "kpropertieskey";
+(NSArray *)loadProperties{
    
    //利用关联对象给类添加属性, OC 中的类,本身就是一个特殊的对象
    /**
     *  获取关联对象
     *
     *  @param self           对象,属性关联到的对象
     *  @param kpropertieskey key,属性的 key
     *
     *  @return  数组
     */
    NSArray *pList =objc_getAssociatedObject(self, kpropertieskey);
    
    if(pList!=nil){
        return pList;
    }
    
    /**
     *  获取该类的所有成员变量
     */
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList([self class], &count);
    NSLog(@"属性的数量 %u",count);
    
    //遍历数组
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
    
    for (unsigned int i = 0; i<count; i++) {
        
        objc_property_t pty = list[i];
        
        //获取属性名称
        const char *cname = property_getName(pty);
        
        //添加到数组
        [arrayM addObject:[NSString stringWithUTF8String:cname]];
    }
    NSLog(@"%@",arrayM);
    free(list);
    /**
     *  设置关联对象的属性
     */
    objc_setAssociatedObject(self, kpropertieskey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return objc_getAssociatedObject(self, kpropertieskey);
}


@end
