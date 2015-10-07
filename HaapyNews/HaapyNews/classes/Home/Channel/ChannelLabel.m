//
//  ChannelLabel.m
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/7.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "ChannelLabel.h"

@implementation ChannelLabel

+(instancetype)channelLabelWithTitle:(NSString *)title{
    ChannelLabel *l =[[ChannelLabel alloc]init];
    l.text = title;
    l.textAlignment = NSTextAlignmentCenter;
    l.font = [UIFont systemFontOfSize:18.0];
    [l sizeToFit];
    l.font = [UIFont systemFontOfSize:14.0];
    return l;
}

@end
