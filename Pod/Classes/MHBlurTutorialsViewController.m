//
//  MHBlurTutorialsViewController.m
//  Pods
//
//  Created by Mathilde Henriot on 09/06/2015.
//
//

#import "MHBlurTutorialsViewController.h"

@interface MHBlurTutorialsViewController () {
    CAShapeLayer *maskLayer;
    int currentIndex;
}

@property (nonatomic, strong) UIView *holeView;
@property (nonatomic, strong) UILabel *explanationLabel;
@property (nonatomic, strong) NSArray *animationsArray;

@end

@implementation MHBlurTutorialsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.holeView = [[UIView alloc] initWithFrame:self.view.frame];
    
    self.explanationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    self.explanationLabel.textAlignment = NSTextAlignmentCenter;
    self.explanationLabel.textColor = [UIColor whiteColor];
    
    [self.holeView addSubview:self.explanationLabel];
    
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.holeView addGestureRecognizer:singleFingerTap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - Public Methods

- (void)setBackgroundColor:(UIColor *)color {
    self.holeView.backgroundColor = color;
}
- (void)setExplanationLabelFont:(UIFont *)font {
    self.explanationLabel.font = font;
}
- (void)setAnimations:(NSArray *)animations {
    self.animationsArray = animations;
    currentIndex = 0;
    [self startAnimationAtIndex:currentIndex];
}
- (void)displayTutorial {
    [self addHoleSubview];
}

#pragma mark - Private Methods

- (void)addHoleSubview {
    [self.view addSubview:self.holeView];
}

- (void)startAnimationAtIndex:(int)index {
    
    CGRect bounds = self.view.frame;
    maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.fillColor = [UIColor blackColor].CGColor;
    
    float kRadius = [self.animationsArray[index][@"holeRadius"] floatValue];
    CGPoint holeCenter = [self.animationsArray[index][@"holeCenter"] CGPointValue];
    CGRect originCircleRect = CGRectMake(holeCenter.x - kRadius,
                                         holeCenter.y - kRadius,
                                         2 * kRadius, 2 * kRadius);
    CGRect finalCircleRect = CGRectMake(holeCenter.x - 2.5 * kRadius / 2,
                                        holeCenter.y - 2.5 * kRadius / 2,
                                        2.5 * kRadius, 2.5 * kRadius);
    
    UIBezierPath *originPath = [UIBezierPath bezierPathWithOvalInRect:originCircleRect];
    [originPath appendPath:[UIBezierPath bezierPathWithRect:bounds]];
    
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:finalCircleRect];
    [finalPath appendPath:[UIBezierPath bezierPathWithRect:bounds]];
    
    maskLayer.path = originPath.CGPath;
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    [maskLayer setValue:@(1) forKeyPath:@"transform.scale"];
    
    self.holeView.layer.mask = maskLayer;
    
    self.explanationLabel.text = self.animationsArray[index][@"text"];
    self.explanationLabel.center = [self.animationsArray[index][@"textCenter"] CGPointValue];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = [maskLayer valueForKeyPath:@"path"];
    animation.toValue = (id)finalPath.CGPath;
    animation.duration = 2;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatDuration = HUGE_VALF;
    animation.autoreverses = YES;
    [maskLayer addAnimation:animation forKey:animation.keyPath];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    [maskLayer removeAllAnimations];
    
    if (currentIndex < [self.animationsArray count]-1) {
        currentIndex++;
        [self startAnimationAtIndex:currentIndex];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}

@end
