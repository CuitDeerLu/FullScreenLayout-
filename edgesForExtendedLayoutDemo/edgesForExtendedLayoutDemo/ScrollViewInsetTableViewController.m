//
//  ScrollViewInsetTableViewController.m
//  edgesForExtendedLayoutDemo
//
//  Created by 泛在吕俊衡 on 2017/5/26.
//  Copyright © 2017年 anjohnlv. All rights reserved.
//

#import "ScrollViewInsetTableViewController.h"

@interface ScrollViewInsetTableViewController ()

@end

@implementation ScrollViewInsetTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"ScrollViewInset";
    
    self.edgesForExtendedLayout=UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets=YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%li",indexPath.row];
    
    return cell;
}

@end
