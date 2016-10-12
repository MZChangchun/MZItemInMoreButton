//
//  MZItemInMoreButton.m
//  xuesheng
//
//  Created by Mr.Yang on 2016/10/11.
//  Copyright © 2016年 Mr.Yang. All rights reserved.
//

#import "MZItemInMoreButton.h"

@implementation MZItemInMoreButton



-(instancetype)initWithImage:(NSString *)imageName title:(NSString *)title {
    self = [super initWithFrame:CGRectMake(0, 0, 60, 80)];
    if (self) {
        UIImageView * image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        image.frame = CGRectMake(0, 0, 60, 60);
        [self addSubview:image];
        UILabel * titleLabel= [[UILabel alloc] initWithFrame:CGRectMake(0, 65, 60, 15)];
        titleLabel.textAlignment = 1;
        titleLabel.text = title;
        [self addSubview:titleLabel];
        
        [self addTarget:self action:@selector(choiceOneButt:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)choiceOneButt:(UIButton *)butt {
    
    //自身变大
//    CGRect bounds = self.bounds
    [UIView animateWithDuration:0.5 animations:^{
        self.transform = CGAffineTransformMakeScale(5, 5);
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.transform = CGAffineTransformMakeScale(1, 1);
        self.alpha = 1;
        
        [self.superview removeFromSuperview];
    
        if (self.delegate && [self.delegate respondsToSelector:@selector(clickthisButton:)]) {
            [self.delegate clickthisButton:self];
        }
    }];
    
    
    
}

- (void)upbutt {
    CGRect frame = self.frame;
    NSLog(@"");
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.frame = CGRectMake(frame.origin.x, frame.origin.y - hiddenHeigh - 20 , frame.size.width, frame.size.height);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.08 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.frame = CGRectMake(frame.origin.x, frame.origin.y - hiddenHeigh , frame.size.width, frame.size.height);
        } completion:nil];
    }];
}
- (void)downbutt {
    CGRect frame = self.frame;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.frame = CGRectMake(frame.origin.x, frame.origin.y + hiddenHeigh, frame.size.width, frame.size.height);
    } completion:nil];
}




@end
