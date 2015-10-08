//
//  NewsCellTableViewCell.h
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/5.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class News;

@interface NewsCellTableViewCell : UITableViewCell

@property (nonatomic,strong) News *news;

//设置可重用标识符
+(NSString *)cellIdentifier:(News *)news;

@end
