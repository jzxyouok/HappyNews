//
//  NewsCellTableViewCell.m
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/5.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "NewsCellTableViewCell.h"
#import "News.h"
//AFN 针对 UIImageView 的分类
#import <UIImageView+AFNetworking.h>

@interface NewsCellTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyLabel;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *extraImageViews;

@end

@implementation NewsCellTableViewCell

-(void)setNews:(News *)news{
    _news=news;
    self.titleLabel.text = news.title;
    self.digestLabel.text = news.digest;
    self.replyLabel.text = [NSString stringWithFormat:@"%d", news.replyCount];
    self.iconView.image = nil;
    // 设置图像 - AFN的图像分类不支持 GIF，绝大多数还是应该用 SDWebImage
    [self.iconView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    if (news.imgextra.count == 2) {
        int index = 0;
        for (UIImageView *iv in self.extraImageViews) {
            NSString *urlString = news.imgextra[index][@"imgsrc"];
            NSURL *url = [NSURL URLWithString:urlString];
            iv.image = nil;
            // 设置图像
            [iv setImageWithURL:url];
            
            index++;
        }
    }

}

- (void)awakeFromNib {

    //设置换行宽度
    self.digestLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - CGRectGetMaxX(self.iconView.frame)-16;
}








+(NSString *)cellIdentifier:(News *)news{
    if (news.imgextra.count==2) {
        return @"ImagesCell";
    }if (news.isBigImage) {
        return @"BigImageCell";
    }
    return @"NewsCell";
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
