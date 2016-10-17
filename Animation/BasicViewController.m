//
//  BasicViewController.m
//  Animation
//
//  Created by leewentao on 16/9/27.
//  Copyright © 2016年 leewentao. All rights reserved.
//

#import "BasicViewController.h"
#import "BButton.h"
#import "SWRevealViewController.h"

//每行最大列数
const NSUInteger maxColumnNum = 3;
//按钮列间距
const CGFloat columnMargin = 16.0;
//按钮行间距
const CGFloat rowMargin = 22.0;
//按钮高度
const CGFloat btnHeight = 44.0;
//按钮宽度
const CGFloat btnWidth = 100.0;

@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)initData{
    [self btnArray];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupViews];
}

- (void)setupViews{
    if (self.btnArray==nil||self.btnArray.count<1) {
        return;
    }
    NSUInteger btnCount = self.btnArray.count;
    NSUInteger rowCount = (btnCount - 1) / maxColumnNum + 1;
    for (int i = 0; i < btnCount; i++) {
        NSUInteger row = i / maxColumnNum + 1;
        NSUInteger columm = i % maxColumnNum;
        CGRect rect = CGRectMake(22+columm*(btnWidth+columnMargin), SCREEN_HEIGHT-(rowCount-row+1)*(rowMargin+btnHeight), btnWidth, btnHeight);
        BButton *btn = [self buttonWithRect:rect title:self.btnArray[i]];
        btn.tag = i;
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    SWRevealViewController *revealController = self.revealViewController;
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
}

- (BButton *)buttonWithRect:(CGRect)rect title:(NSString *)title
{
    BButton *btn = [[BButton alloc] initWithFrame:rect type:BButtonTypePrimary style:BButtonStyleBootstrapV3];
    [btn setTitle:title forState:UIControlStateNormal];
    return btn;
}

-(void)click:(UIButton *)btn
{
    SEL sel = NSSelectorFromString(btn.titleLabel.text);
    if ([self respondsToSelector:sel]) {
        [self performSelector:sel withObject:nil];
    }else{
        NSLog(@"Not Found the function:%@.",btn.titleLabel.text);
    }
}

@end
