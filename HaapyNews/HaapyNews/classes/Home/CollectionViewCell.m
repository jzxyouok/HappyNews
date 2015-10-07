//
//  CollectionViewCell.m
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/7.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "CollectionViewCell.h"
#import "NewsTableViewController.h"

@interface CollectionViewCell ()

@end

@implementation CollectionViewCell

- (void)setUrlString:(NSString *)urlString {
    // 只是负责将 urlString 传递给 newsVC，本身没有任何用处！
    //    _urlString = urlString;
    
    // 设置新闻控制器的 URL
    self.newsVC.urlString = urlString;
}


- (void)awakeFromNib {
    
    NSLog(@"%s %@",__func__,NSStringFromCGRect(self.bounds));
    
    /**
     *  加载新闻控制器的视图
     */
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    self.newsVC = sb.instantiateInitialViewController;
    
    [self addSubview:self.newsVC.view];

}
-(void)layoutSubviews{
    [super layoutSubviews];

    
    self.newsVC.view.frame = self.bounds;
}

@end
