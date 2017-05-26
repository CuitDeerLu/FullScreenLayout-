//
//  ViewController.m
//  edgesForExtendedLayoutDemo
//
//  Created by 泛在吕俊衡 on 2017/5/26.
//  Copyright © 2017年 anjohnlv. All rights reserved.
//

#import "ViewController.h"
#import "ScrollViewInsetTableViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor greenColor];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.navigationController.navigationBar.translucent=NO;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ScrollViewInsetTableViewController *view=[[ScrollViewInsetTableViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
}
@end
