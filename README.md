# MZItemInMoreButton
#仿微信更多tabBarItem
先上图
![image](https://github.com/MZChangchun/MZItemInMoreButton/blob/master/Untitled.gif)

前天刚接个需求，要求在项目的 `UITabBarController`中再添加一个item。本来就已经5个的item经不起需求的更改变成了更多。于是就准备着手写一个有更多按钮的UITabBarController
于是在git上找到了一个叫做`DCPathButton`应该可以使用。添加到项目中才发现，当我的视图控制器使用`hidesBottomBarWhenPushed=YES;`和`hidesBottomBarWhenPushed=NO；`
去隐藏`tabbar`以后，`DCPathButton`就开始不听话的该出现的时候不出现，不该出现的时候出现了。
想一想不用这个，又研究了许多发现没有自己需要的。于是开始了造轮子的旅程。

#优点
1.再也不用担心使用`hidesBottomBarWhenPushed=YES;`和`hidesBottomBarWhenPushed=NO；`的时候出现那些奇怪的bug了    
2.more里面的按钮点击以后，和微信不一样的是视图控制器还是在`UITabBarController`中    
3.自动布局，允许两排，多的自动删除     
缺点：     
最多只允许加载两排。后期会继续优化，希望有伙伴帮助优化

使用这个控件很简单     
1.导入头文件`#import "MZRotateTabbarMoreButton.h"`添加代理 `MZItemInMoreButtonDelegate`     
2.`@property (nonatomic, strong)MZRotateTabbarMoreButton * button`;     
3.创建你的`UITabBarController`，初始化第三个视图控制器并不要添加`tabBarItem.title`和`navigationItem.title`
```
    UIViewController * tempViewController = [[UIViewController alloc] init];
    tempViewController.view.backgroundColor = [UIColor whiteColor];
    tempViewController.navigationItem.title = @"这是一个空界面";
    UINavigationController * nav3 = [[UINavigationController alloc] initWithRootViewController:tempViewController];
```     
4.self.button = [[MZRotateTabbarMoreButton alloc] initWithImageName:@"你的图片名字" superTabbarController:self];     
5.创建更多按钮点击后界面的按钮
```
  MZItemInMoreButton * butt1 = [[MZItemInMoreButton alloc] initWithImage:@"sb1" title:@"五娃"];
    butt1.tag = 110;//根据这个在代理中加载视图
    butt1.delegate = self;
```      
6.将这些按钮加入到我们的`button`中，并将`button`添加到`tabbar`上去
```
    self.button.buttArray = @[butt1, butt2, butt3, butt4, butt5, butt6, butt7];
    [self.tabBar addSubview:self.button];
```      
7.最后一步，在代理中完成逻辑处理
```
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
```

##千万要注意，如果你没有`[self.tabBar bringSubviewToFront:self.button];`的话，你点击一次更多里面的按钮后，这个tabbar上的`button`就无法点击了

##这时候你可能会问：为什么没有6娃呢？真是遗憾啊，6娃隐身没抓到啊！！！！

##编程是一种乐趣，分享是乐趣的一部分，如果你有好的想法或建议，欢迎讨论


