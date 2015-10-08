//
//  NewsTableViewController.m
//  HaapyNews
//
//  Created by 甲丁乙_ on 15/10/1.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "NewsTableViewController.h"
#import "News.h"
#import "NewsCellTableViewCell.h"

@interface NewsTableViewController ()

@property (nonatomic,strong) NSArray *newsList;

@end

@implementation NewsTableViewController

-(void)setNewsList:(NSArray *)newsList{
    
    _newsList=newsList;
    
    //刷新表格
    [self.tableView reloadData];
}

- (void)setUrlString:(NSString *)urlString  {
    self.newsList = nil ;
    __weak typeof (self) weakself = self ;
    [News loadNewsListWithURLString:urlString finished:^(NSArray *newsList) {
        //设置数组的数值
        weakself.newsList = newsList;
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
     //设置预估行高
    self.tableView.estimatedRowHeight = 80;
//     设置行高-自动计算行高
//     要求：
//     1. cell中要有向下的约束，能够撑开整个cell
//     2. 所有的约束不能有负值
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    
   
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.newsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    News *news = self.newsList[indexPath.row];
    NSString *ID = [NewsCellTableViewCell cellIdentifier:news];
    NewsCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    cell.news = news;

    
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    return 80;
//
//}



@end
