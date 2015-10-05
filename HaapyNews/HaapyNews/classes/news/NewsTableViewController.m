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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight=80.0f;
    __weak typeof (self) weakself = self ;
    [News loadNewsListWithURLString:@"T1348647853363/0-20.html"finished:^(NSArray *newsList) {
        //设置数组的数值
        weakself.newsList = newsList;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.newsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
    
    cell.news = self.newsList[indexPath.row];

    
    return cell;
}



@end
