//
//  TTGrounpAnimController.m
//  Animation
//
//  Created by leewentao on 16/10/7.
//  Copyright © 2016年 leewentao. All rights reserved.
//

#import "TTGrounpAnimController.h"

@interface TTGrounpAnimController ()

@property (nonatomic,strong) UIView *demoView;

@end


@implementation TTGrounpAnimController

- (NSArray *)btnArray{
    return @[@"group"];
}

- (void)setupViews
{
    [super setupViews];
    _demoView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-90, SCREEN_HEIGHT/2-240, 180, 180)];
    _demoView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_demoView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)group
{
    CABasicAnimation *positionAni = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAni.fromValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/2, 0)];
    positionAni.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)];
    
    CABasicAnimation *opacityAni = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAni.toValue = [NSNumber numberWithFloat:1.0];
    opacityAni.toValue = [NSNumber numberWithFloat:0.5];
    
    CABasicAnimation *boundsAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    boundsAni.toValue = [NSNumber numberWithFloat:0.5f];
    
    CAAnimationGroup *groupAni = [CAAnimationGroup animation];
    groupAni.animations = @[positionAni,opacityAni,boundsAni];
    groupAni.duration = 2.0;
    groupAni.fillMode = kCAFillModeBoth;
    groupAni.removedOnCompletion = YES;
    groupAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.demoView.layer addAnimation:groupAni forKey:@"groupAni"];
}
@end
