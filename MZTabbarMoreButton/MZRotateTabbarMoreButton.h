//
//  MZRotateTabbarMoreButton.h
//  xuesheng
//
//  Created by Mr.Yang on 2016/10/11.
//  Copyright © 2016年 Mr.Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MZItemInMoreButton.h"

@interface MZRotateTabbarMoreButton : UIButton

@property (nonatomic, strong)NSArray * buttArray;

- (instancetype)initWithImageName:(NSString *)imageName
            superTabbarController:(UIViewController *)tabbarController;

@end





@interface MZMoreView : UIView

- (instancetype)initWithFrame:(CGRect)frame buttonArray:(NSMutableArray *)buttArray;
@end
