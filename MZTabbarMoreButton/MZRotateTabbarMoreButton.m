//
//  MZRotateTabbarMoreButton.m
//  xuesheng
//
//  Created by Mr.Yang on 2016/10/11.
//  Copyright © 2016年 Mr.Yang. All rights reserved.
//

#import "MZRotateTabbarMoreButton.h"


@interface MZRotateTabbarMoreButton()


@property (nonatomic, assign)UIViewController * superTabbarController;

@end


@implementation MZRotateTabbarMoreButton

- (instancetype)initWithImageName:(NSString *)imageName
            superTabbarController:(UIViewController *)tabbarController {
    self = [super init];
    if (self) {
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(showMoreView) forControlEvents:UIControlEventTouchUpInside];
        self.bounds = CGRectMake(0, 0, tabbarController.view.bounds.size.width / 5.0 + 2, tabbarController.view.bounds.size.height);
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        self.center = CGPointMake(tabbarController.view.bounds.size.width / 2, 49/2.0);
        self.superTabbarController = tabbarController;
    }
    return self;
}

- (void)showMoreView {
    //覆盖界面
    MZMoreView * view = [[MZMoreView alloc] initWithFrame:self.superTabbarController.view.frame buttonArray:[[NSMutableArray alloc] initWithArray:self.buttArray]];
    view.backgroundColor = [UIColor whiteColor];
    [self.superTabbarController.view addSubview:view];
    
}


@end




@interface MZMoreView()
{
    CGFloat downTime;
}
@property (nonatomic, strong)UIButton * cancelButton;
@property (nonatomic, strong)NSMutableArray * array;

@property (nonatomic, strong)NSTimer * timers;
@property (nonatomic, assign)int beginNumber;

@end

@implementation MZMoreView

//CGFloat hiddenHeigh = 130 + 80 + 36 + 80;

- (instancetype)initWithFrame:(CGRect)frame buttonArray:(NSMutableArray *)buttArray {
    self = [super initWithFrame:frame];
    if (self) {
        self.beginNumber = 0;
        downTime = 0;
        self.cancelButton = [[UIButton alloc] init];
        [self.cancelButton setImage:[UIImage imageNamed:@"chooser-button-tab"] forState:UIControlStateNormal];
        self.cancelButton.bounds = CGRectMake(0, 0, 45, 45);
        self.cancelButton.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height - 25.5f);
        [self.cancelButton addTarget:self action:@selector(removeAllThisView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cancelButton];
        self.alpha = 0.95;
        self.array = [buttArray mutableCopy];
        self.cancelButton.userInteractionEnabled = 0;
        [UIView animateWithDuration:0.8 animations:^{
            self.cancelButton.transform = CGAffineTransformRotate(self.cancelButton.transform, M_PI_4);
        } completion:^(BOOL finished) {
            self.cancelButton.userInteractionEnabled = 1;
        }];
        [self buttonlayout];
        [self upButt];
    }
    return self;
}
- (void)removeAllThisView {
    self.cancelButton.userInteractionEnabled = 0;
    [self downButt];
    [UIView animateWithDuration:downTime animations:^{
        self.cancelButton.transform = CGAffineTransformRotate(self.cancelButton.transform, -M_PI_4);
    } completion:^(BOOL finished) {
        self.cancelButton.userInteractionEnabled = 1;
        [self removeFromSuperview];
    }];
    
}

//button布局
- (void)buttonlayout {
    if (!self.array) {
        return;
    }
    for (id butt in self.array) {
        if (![butt isKindOfClass:[MZItemInMoreButton class]]) {
            return;
        }
    }
    
    int numberRow = floor((self.bounds.size.width - 20.0) / 100.0);//每行最多个数

    //一行
    if (numberRow >= self.array.count) {
        [self.array enumerateObjectsUsingBlock:^(MZItemInMoreButton * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.center = CGPointMake(30 + (self.bounds.size.width - 60)/(2 * self.array.count)*(idx * 2 + 1), self.bounds.size.height - 228 + hiddenHeigh);
            [self addSubview:obj];
        }];
    } else {//两行或更多最多只显示两行
        
        if (self.array.count > numberRow * 2) {
            NSArray * array = [self.array subarrayWithRange:NSMakeRange(0, numberRow * 2)];
            self.array = [NSMutableArray arrayWithArray:array];
        }
        CGFloat distance = (self.bounds.size.width - 60 * (numberRow + 1)) / (numberRow - 1);
        [self.array enumerateObjectsUsingBlock:^(MZItemInMoreButton * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.center = CGPointMake(60 + (distance + 60) * ( idx % numberRow), self.bounds.size.height - 286 + (idx / numberRow) * (80 + 36) + hiddenHeigh);
            [self addSubview:obj];
        }];
    }
    downTime = 0.05 * self.array.count + 0.38;
    
}

//升起
-(void)upButt {
    //上升以后再下降
    self.timers = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(beginUp) userInfo:nil repeats:1];

}
- (void)beginUp {
    MZItemInMoreButton * obj = self.array[self.beginNumber];
    [obj upbutt];
    if (self.beginNumber >= self.array.count - 1) {
        [_timers invalidate];
        _timers = nil;
        return;
    }
    self.beginNumber += 1;
}

//落下
- (void)downButt {
    self.timers = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(begindown) userInfo:nil repeats:1];

}
- (void)begindown {
    MZItemInMoreButton * obj = self.array[self.beginNumber];
    [obj downbutt];
    if (self.beginNumber == 0) {
        [_timers invalidate];
        _timers = nil;
        return;
    }
    self.beginNumber -= 1;
}




@end





