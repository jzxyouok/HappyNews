//
//  HomeViewController.m
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/7.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "HomeViewController.h"
#import "Channel.h"
#import "ChannelLabel.h"
#import "CollectionViewCell.h"

@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
/**
 *  频道数据
 */
@property (nonatomic,strong) NSArray *channelList;
/**
 *  频道视图
 */
@property (weak, nonatomic) IBOutlet UIScrollView *channelView;
/**
 *  容器视图
 */
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
/**
 *  流水布局
 */
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置频道
    [self setUpChannel];
    
    NSLog(@"%s %@", __FUNCTION__, NSStringFromCGRect(self.collectionView.frame));
}


// 在 OC 中，所有的布局，都是`由外向内`
// 提示：以下四个方法，不要`死记硬背`，因为在不同的场景，效果会不一样
// 根据实际情况，Log 确认，选择最佳的方法来写！
// 视图将要出现，子视图还没有开始布局
// 子视图已经布局完成
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    NSLog(@"%s %@", __FUNCTION__, NSStringFromCGRect(self.view.frame));
    NSLog(@"%s %@", __FUNCTION__, NSStringFromCGRect(self.collectionView.frame));
}

// 子视图将要开始布局，还没开始
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSLog(@"%s %@", __FUNCTION__, NSStringFromCGRect(self.collectionView.frame));
}

// 子视图已经布局完成
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSLog(@"%s %@", __FUNCTION__, NSStringFromCGRect(self.collectionView.frame));
    // 设置布局
    [self setupLayout];
}

// 视图已经出现
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"%s %@", __FUNCTION__, NSStringFromCGRect(self.collectionView.frame));
}



- (void)setupLayout {
    self.layout.itemSize = self.collectionView.bounds.size;
    self.layout.minimumInteritemSpacing = 0;
    self.layout.minimumLineSpacing = 0;
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 允许分页
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}


#pragma mark - 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.channelList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
//    
        cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
   
#warning TODO
    // 设置 URL String
    cell.urlString = [self.channelList[indexPath.item] urlString];
    
    // *** 在用代码开发时，如果出现多视图控制器的情况，一定要注意添加子控制器
    // 提示：在当前的代码中不会出问题，但是一定要添加
    // 否则，响应者链条的传递会出问题，会出现很莫名其妙的情况！
    // 控制器一定要知道内部的所有细节！
    
    // 判断是否已经添加了子控制器
    if (![self.childViewControllers containsObject:cell.newsVC]) {
        [self addChildViewController:cell.newsVC];
    }
    
    NSLog(@"%@", self.childViewControllers);
    
    return cell;

}


-(void)setUpChannel{
    //取消 scrollView 的自动缩进
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //遍历频道数组,添加 label
    CGFloat margin = 8.0;
    CGFloat x = margin;
    CGFloat h = self.channelView.bounds.size.height;
    for (Channel *channel in self.channelList) {
        
        // 已经计算好了 width
        ChannelLabel *l = [ChannelLabel channelLabelWithTitle:channel.tname];
        
        // 设置位置
        l.frame = CGRectMake(x, 0, l.bounds.size.width, h);
        
        // 递增 x
        x += l.bounds.size.width;
        
        [self.channelView addSubview:l];
    }
    
    // 设置 contentSize
    self.channelView.contentSize = CGSizeMake(x + margin, h);
}

/**
 *  懒加载
 */
-(NSArray *)channelList{
    if (_channelList == nil) {
        _channelList = [Channel channelList];
    }
    return _channelList;
}
@end
