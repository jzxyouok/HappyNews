//
//  ChannelLabel.h
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/7.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChannelLabelDelegate;

@interface ChannelLabel : UILabel

/**
 从 0~1
 0: 14 号字
 1: 18 号字
 */
@property (nonatomic, assign) float scale;
@property (nonatomic, weak) id<ChannelLabelDelegate> delegate;


+(instancetype)channelLabelWithTitle:(NSString *)title;

@end

@protocol ChannelLabelDelegate <NSObject>

- (void)channelLabelDidSelected:(ChannelLabel *)label;

@end