//
//  ChannelLabel.m
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/7.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "ChannelLabel.h"

#define WZYNormalFontSize 14.0
#define WZYSelectedFontSize 18.0

@implementation ChannelLabel

+(instancetype)channelLabelWithTitle:(NSString *)title{
    ChannelLabel *l =[[ChannelLabel alloc]init];
    l.text = title;
    l.textAlignment = NSTextAlignmentCenter;
    l.font = [UIFont systemFontOfSize:WZYSelectedFontSize];
    [l sizeToFit];
    l.font = [UIFont systemFontOfSize:WZYNormalFontSize];
    [l setUserInteractionEnabled:YES];
    return l;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([self.delegate respondsToSelector:@selector(channelLabelDidSelected:)]) {
        [self.delegate channelLabelDidSelected:self];
    }
}

- (void)setScale:(float)scale {
    // (18 - 14) / 14
    float percent = (WZYSelectedFontSize - WZYNormalFontSize) / WZYNormalFontSize;
    // scale = 0  percent = 1
    // scale = 1  4/14 + 1;
    percent = percent * scale + 1;
    
    // 通过 transform 设置大小
    self.transform = CGAffineTransformMakeScale(percent, percent);
    
    // 设置颜色
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1];
}


@end
