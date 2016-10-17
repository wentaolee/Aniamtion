//
//  TTTranstionController.m
//  Animation
//
//  Created by leewentao on 16/9/27.
//  Copyright © 2016年 leewentao. All rights reserved.
//

#import "TTTranstionController.h"


@interface TTTranstionController ()

@property (strong, nonatomic) UIView *demoView;

@end

@implementation TTTranstionController

- (NSArray *)btnArray{
    return @[@"fade",@"moveIn",@"push",@"reveal",@"cube",@"suck",@"oglFlip",@"ripple",@"curl",@"unCurl",@"caOpen",@"caClose"];
}


- (void)setupViews
{
    [super setupViews];
    _demoView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-90, SCREEN_HEIGHT/2-240,180,260)];
    _demoView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_demoView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)fade {
   [self animationWithType:kCATransitionFade];
    }

- (void)moveIn {
    [self animationWithType:kCATransitionMoveIn];
    
}

- (void)push {
    [self animationWithType:kCATransitionPush];
   }

- (void)reveal {
    [self animationWithType:kCATransitionReveal];
    
}

- (void)cube {
   [self animationWithType:@"cube"];
    
}

- (void)suck {
    [self animationWithType:@"suckEffect"];
    
}

- (void)oglFlip {
     [self animationWithType:@"oglFlip"];
    
}

- (void)ripple {
     [self animationWithType:@"rippleEffect"];
    
}

- (void)curl {
     [self animationWithType:@"pageCurl"];
    }

- (void)unCurl {

    [self animationWithType:@"pageUnCurl"];

}

- (void)caOpen {
    [self animationWithType:@"cameraIrisHollowOpen"];
}

- (void)caClose {
    [self animationWithType:@"cameraIrisHollowClose"];
}

- (UIColor *)changeColorWithOldColor:(UIColor *)color
{
    if (color == [UIColor orangeColor]) {
        return [UIColor purpleColor];
    }else{
        return [UIColor orangeColor];
    }
}

- (NSString *)direction
{
    if (arc4random() % 2 == 0) {
        return kCATransitionFromLeft;
    }else{
        return kCATransitionFromRight;
    }
}

- (void)animationWithType:(NSString *)type
{
    CATransition *ani = [CATransition animation];
    ani.type = type;
    ani.subtype = [self direction];
    ani.duration = 1.0f;
    self.demoView.backgroundColor = [self changeColorWithOldColor:self.demoView.backgroundColor];
    [self.demoView.layer addAnimation:ani forKey:[NSString stringWithFormat:@"%@Animation",type]];
}
@end
