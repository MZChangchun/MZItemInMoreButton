//
//  FirstViewController.m
//  MZTabbarMoreButtonDemo
//
//  Created by Mr.Yang on 2016/10/12.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.title = @"第一页";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)secondViewController:(id)sender {
    self.navigationController.viewControllers[0].hidesBottomBarWhenPushed=YES;
    
    [self.navigationController pushViewController:[[SecondViewController alloc] init] animated:1];
    
    self.navigationController.viewControllers[0].hidesBottomBarWhenPushed=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
