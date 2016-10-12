//
//  DemoTabbarController.m
//  MZTabbarMoreButtonDemo
//
//  Created by Mr.Yang on 2016/10/12.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "DemoTabbarController.h"
#import "FirstViewController.h"


#import "MZRotateTabbarMoreButton.h"


@interface DemoTabbarController ()<MZItemInMoreButtonDelegate>
@property (nonatomic, strong)MZRotateTabbarMoreButton * button;
@end

@implementation DemoTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FirstViewController * viewController1 = [[FirstViewController alloc] init];
    viewController1.view.backgroundColor = [UIColor redColor];
    viewController1.tabBarItem.title = @"大娃";
    viewController1.navigationItem.title = @"大娃";
    viewController1.tabBarItem.image = [UIImage imageNamed:@"music"];
    UINavigationController * nav1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    
    FirstViewController * viewController2 = [[FirstViewController alloc] init];
    viewController2.view.backgroundColor = [UIColor orangeColor];
    viewController2.tabBarItem.title = @"二娃";
    viewController2.navigationItem.title = @"二娃";
    viewController2.tabBarItem.image = [UIImage imageNamed:@"duang"];
    UINavigationController * nav2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
    
    UIViewController * tempViewController = [[UIViewController alloc] init];
    tempViewController.view.backgroundColor = [UIColor whiteColor];
    tempViewController.navigationItem.title = @"这是一个空界面";
    UINavigationController * nav3 = [[UINavigationController alloc] initWithRootViewController:tempViewController];
    
    FirstViewController * viewController4 = [[FirstViewController alloc] init];
    viewController4.view.backgroundColor = [UIColor greenColor];
    viewController4.tabBarItem.title = @"三娃";
    viewController4.navigationItem.title = @"三娃";
    viewController4.tabBarItem.image = [UIImage imageNamed:@"deng"];
    UINavigationController * nav4 = [[UINavigationController alloc] initWithRootViewController:viewController4];
    
    FirstViewController * viewController5 = [[FirstViewController alloc] init];
    viewController5.view.backgroundColor = [UIColor blueColor];
    viewController5.tabBarItem.title = @"四娃";
    viewController5.navigationItem.title = @"四娃";
    viewController5.tabBarItem.image = [UIImage imageNamed:@"dian"];
    UINavigationController * nav5 = [[UINavigationController alloc] initWithRootViewController:viewController5];
    
    self.viewControllers = @[nav1, nav2, nav3, nav4, nav5];
    
    
    self.button = [[MZRotateTabbarMoreButton alloc] initWithImageName:@"chooser-button-tab" superTabbarController:self];
    
    MZItemInMoreButton * butt1 = [[MZItemInMoreButton alloc] initWithImage:@"sb1" title:@"五娃"];
    butt1.tag = 110;
    butt1.delegate = self;
    MZItemInMoreButton * butt2 = [[MZItemInMoreButton alloc] initWithImage:@"sb2" title:@"七娃"];
    butt2.tag = 111;
    butt2.delegate = self;
    
    MZItemInMoreButton * butt3 = [[MZItemInMoreButton alloc] initWithImage:@"sb2" title:@"蛇精"];
    butt3.tag = 112;
    butt3.delegate = self;
    MZItemInMoreButton * butt4 = [[MZItemInMoreButton alloc] initWithImage:@"sb2" title:@"葫芦"];
    butt4.tag = 113;
    butt4.delegate = self;
    MZItemInMoreButton * butt5 = [[MZItemInMoreButton alloc] initWithImage:@"sb2" title:@"葫芦瓢"];
    butt5.tag = 114;
    butt5.delegate = self;
    MZItemInMoreButton * butt6 = [[MZItemInMoreButton alloc] initWithImage:@"sb2" title:@"鸭梨大"];
    butt6.tag = 115;
    butt6.delegate = self;
    MZItemInMoreButton * butt7 = [[MZItemInMoreButton alloc] initWithImage:@"sb2" title:@"神曲"];
    butt7.tag = 116;
    butt7.delegate = self;
    
    self.button.buttArray = @[butt1, butt2, butt3, butt4, butt5, butt6, butt7];
    
    [self.tabBar addSubview:self.button];
    
}





#pragma mark-MZItemInMoreButtonDelegate
- (void)clickthisButton:(UIButton *)butt {
    NSLog(@"%ld", (long)butt.tag);
    
    switch (butt.tag) {
        case 110: {
            FirstViewController * viewcontroller6 = [[FirstViewController alloc] init];
            viewcontroller6.navigationItem.title = @"五娃";
            UINavigationController * nav6 = [[UINavigationController alloc] initWithRootViewController:viewcontroller6];
            NSMutableArray * array = [self.viewControllers mutableCopy];
            [array replaceObjectAtIndex:2 withObject:nav6];
            self.viewControllers = [array copy];
        }
            break;
        case 111: {
            FirstViewController * viewcontroller7 = [[FirstViewController alloc] init];
            viewcontroller7.navigationItem.title = @"七娃";
            UINavigationController * nav7 = [[UINavigationController alloc] initWithRootViewController:viewcontroller7];
            NSMutableArray * array = [self.viewControllers mutableCopy];
            [array replaceObjectAtIndex:2 withObject:nav7];
            self.viewControllers = [array copy];
        }
            break;
        default:
            break;
    }
    
    
    
    self.selectedIndex = 2;
    [self.tabBar bringSubviewToFront:self.button];
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
