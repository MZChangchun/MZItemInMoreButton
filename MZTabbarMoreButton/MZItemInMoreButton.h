//
//  MZItemInMoreButton.h
//  xuesheng
//
//  Created by Mr.Yang on 2016/10/11.
//  Copyright © 2016年 Mr.Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
static int hiddenHeigh = 326;
@class MZItemInMoreButton;
@protocol MZItemInMoreButtonDelegate <NSObject>

@optional
-(void)clickthisButton:(UIButton *)butt;

@end


@interface MZItemInMoreButton : UIButton

@property (nonatomic, assign) id<MZItemInMoreButtonDelegate> delegate;
-(instancetype)initWithImage:(NSString *)imageName title:(NSString *)title;

- (void)upbutt;
- (void)downbutt;

@end
