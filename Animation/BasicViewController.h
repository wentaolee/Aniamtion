//
//  BasicViewController.h
//  Animation
//
//  Created by leewentao on 16/9/27.
//  Copyright © 2016年 leewentao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTConstant.h"

@interface BasicViewController : UIViewController

/**
 按钮数组
 */
@property (nonatomic,strong) NSArray *btnArray;

/**
 初始化页面
 */
- (void)setupViews;

/**
 按钮事件绑定
 */
- (void)click:(UIButton *)btn;


@end
