//
//  ViewController.m
//  Animation
//
//  Created by leewentao on 16/6/20.
//  Copyright © 2016年 leewentao. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import "BButton.h"

@interface ViewController ()

@property (strong, nonatomic)  UIView *cartCenter;

@property (strong, nonatomic)  UIImageView *centerShow;

@end

@implementation ViewController

- (UIView *)cartCenter{
    if (!_cartCenter) {
        _cartCenter = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
        _cartCenter.backgroundColor = [UIColor blueColor];
    }
    return _cartCenter;
}

- (UIImageView *)centerShow{
    if (!_centerShow) {
        _centerShow = [[UIImageView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
        _centerShow.image = [UIImage imageNamed:@"book.png"];
    }
    return _centerShow;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.centerShow];
    [self.view addSubview:self.cartCenter];
    BButton *btn = [[BButton alloc] initWithFrame:CGRectMake(20, 64, 100, 44) type:BButtonTypePrimary style:BButtonStyleBootstrapV3];
    [btn setTitle:@"button" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self groupAni];
//    [self transtionAni];
    //[self pathKeyframeAni];
    //[self valueKeyframeAni];
    //[self position];
    //[self blockAni6];
}

- (void)groupAni {
    
    CABasicAnimation *positionAni = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAni.toValue = [NSValue valueWithCGPoint:self.centerShow.center];
    
    CABasicAnimation *opacityAni = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAni.toValue = [NSNumber numberWithFloat:1.0];
    opacityAni.toValue = [NSNumber numberWithFloat:0.5];
    
    CABasicAnimation *boundsAni = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAni.toValue = [NSValue valueWithCGRect:self.centerShow.frame];
    
    CAAnimationGroup *groupAni = [CAAnimationGroup animation];
    groupAni.animations = @[positionAni,opacityAni,boundsAni];
    groupAni.duration = 1.0;
    groupAni.fillMode = kCAFillModeForwards;
    groupAni.removedOnCompletion = NO;
    groupAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.cartCenter.layer addAnimation:groupAni forKey:@"groupAni"];
}

- (void)transtionAni {

    CATransition *ani = [CATransition animation];
    ani.type = kCATransitionMoveIn;
    ani.subtype = kCATransitionFromLeft;
    ani.duration = 1.0;
    self.centerShow.image = [UIImage imageNamed:@"plan"];
    [self.centerShow.layer addAnimation:ani forKey:@"transtionAni"];
}

- (void)valueKeyframeAni {

    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    ani.duration = 3.0;
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(150, 200)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(250, 200)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(250, 300)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(150, 300)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(150, 200)];
    ani.values = @[value1,value2,value3,value4,value5];
    [self.cartCenter.layer addAnimation:ani forKey:@"positionAni"];
    
}

- (void)pathKeyframeAni {
    
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)];
    ani.path = path.CGPath;
    ani.fillMode = kCAFillModeForwards;
    ani.duration = 3.0;
    ani.removedOnCompletion = NO;
    [self.cartCenter.layer addAnimation:ani forKey:@"positionAni"];
    
}

- (void)position {
    
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"position"];
    ani.duration = 0.5;
    ani.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.cartCenter.layer addAnimation:ani forKey:@"postionAni"];
}

- (void)changeFrame {
    [UIView beginAnimations:@"FrameAni" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(startAni:)];
    [UIView setAnimationDidStopSelector:@selector(stopAni:)];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.cartCenter.frame = self.centerShow.frame;
    [UIView commitAnimations];
}

- (void)flipAni {
    [UIView beginAnimations:@"FlipAni" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(startAni:)];
    [UIView setAnimationDidStopSelector:@selector(stopAni:)];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.centerShow cache:YES];
    self.centerShow.image = [UIImage imageNamed:@"plan"];
    [UIView commitAnimations];
}

- (void)blockAni6 {
    [UIView transitionWithView:self.centerShow duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        self.centerShow.image = [UIImage imageNamed:@"plan"];
    } completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
}

- (void)startAni:(NSString *)aniID {
    NSLog(@"%@ start",aniID);
}

- (void)stopAni:(NSString *)aniID {
    NSLog(@"%@ stop",aniID);
}

@end
