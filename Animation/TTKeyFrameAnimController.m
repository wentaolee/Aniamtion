//
//  TTKeyFrameAnimController.m
//  Animation
//
//  Created by leewentao on 16/9/22.
//  Copyright © 2016年 leewentao. All rights reserved.
//

#import "TTKeyFrameAnimController.h"


@interface TTKeyFrameAnimController ()

@property (strong, nonatomic) UIImageView *demoView;

@end

@implementation TTKeyFrameAnimController

- (NSArray *)btnArray{
    return @[@"keyFrame",@"path",@"shake"];
}

- (void)setupViews
{
    [super setupViews];
    _demoView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT/2-50, 100, 100)];
    _demoView.image = [UIImage imageNamed:@"plan.png"];
    [self.view addSubview:_demoView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)keyFrame
{
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    ani.duration = 2.0f;
    ani.removedOnCompletion = YES;
    ani.fillMode = kCAFillModeBackwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(150, 200)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(250, 200)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(250, 300)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(150, 300)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(150, 200)];
    ani.values = @[value1,value2,value3,value4,value5];
    [self.demoView.layer addAnimation:ani forKey:@"keyFrameAnimation"];
}

- (void)path
{
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)];
    ani.path = path.CGPath;
    ani.fillMode = kCAFillModeBackwards;
    ani.removedOnCompletion = YES;
    ani.duration = 2.0f;
    [self.demoView.layer addAnimation:ani forKey:@"pathAnimation"];
}

- (void)shake
{
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSValue *value1 = [NSNumber numberWithFloat:-M_PI/180*4];
    NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*4];
    NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*4];
    ani.values = @[value1,value2,value3];
    ani.repeatCount = 1314;
    [self.demoView.layer addAnimation:ani forKey:@"shakeAnimation"];
}

@end
