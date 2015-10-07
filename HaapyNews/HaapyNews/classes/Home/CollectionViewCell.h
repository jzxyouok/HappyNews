//
//  CollectionViewCell.h
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/7.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsTableViewController;
@interface CollectionViewCell : UICollectionViewCell
// 加载新闻的 URL 字符串
@property (nonatomic, strong) NSString *urlString;
// 新闻视图控制器
@property (nonatomic, strong) NewsTableViewController *newsVC;
@end
