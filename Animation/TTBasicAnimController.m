//
//  TTBasicAnimController.m
//  Animation
//
//  Created by leewentao on 16/9/22.
//  Copyright © 2016年 leewentao. All rights reserved.
//

#import "TTBasicAnimController.h"

@interface TTBasicAnimController ()

@property (nonatomic,strong) UIView *demoView;

@end

@implementation TTBasicAnimController

- (void)setupViews
{
    [super setupViews];
    _demoView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-90, SCREEN_HEIGHT/2-240,180,260)];
    _demoView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_demoView];
}

- (NSArray *)btnArray{
    return @[@"position",@"opacity",@"scale",@"rotation",@"background"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)position
{
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"position"];
    ani.duration = 2.0;
    ani.fromValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/2, 0)];
    ani.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)];
    ani.removedOnCompletion = YES;
    ani.fillMode = kCAFillModeBackwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.demoView.layer addAnimation:ani forKey:@"postionAni"];
}

- (void)opacity
{
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"opacity"];
    ani.duration = 2.0;
    ani.fromValue = [NSNumber numberWithFloat:1.0f];
    ani.toValue = [NSNumber numberWithFloat:0.1f];
    ani.removedOnCompletion = YES;
    ani.fillMode = kCAFillModeBackwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.demoView.layer addAnimation:ani forKey:@"opacityAni"];
}

- (void)scale
{
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    ani.duration = 2.0;
    ani.fromValue = [NSNumber numberWithFloat:1.5f];
    ani.toValue = [NSNumber numberWithFloat:0.5f];
    ani.removedOnCompletion = YES;
    ani.fillMode = kCAFillModeBackwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.demoView.layer addAnimation:ani forKey:@"scaleAni"];
}

- (void)rotation
{
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    ani.duration = 2.0;
    ani.toValue = [NSNumber numberWithFloat:-M_PI];
    ani.removedOnCompletion = YES;
    ani.fillMode = kCAFillModeBackwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.demoView.layer addAnimation:ani forKey:@"rotationAni"];
}

- (void)background
{
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    ani.duration = 2.0;
    ani.toValue = (id)[UIColor redColor].CGColor;
    ani.removedOnCompletion = YES;
    ani.fillMode = kCAFillModeBackwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.demoView.layer addAnimation:ani forKey:@"backgroundAni"];
}


@end
