//
//  MHViewController.m
//  MHBlurTutorials
//
//  Created by Mathilde Henriot on 06/09/2015.
//  Copyright (c) 2014 Mathilde Henriot. All rights reserved.
//

#import "MHViewController.h"
#import <MHBlurTutorials/MHBlurTutorialsViewController.h>

@interface MHViewController ()

@end

@implementation MHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [self displayTutorials:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)displayTutorials:(id)sender {
    MHBlurTutorialsViewController *homeTutorialController = [[MHBlurTutorialsViewController alloc] init];
    homeTutorialController.modalPresentationStyle = UIModalPresentationOverFullScreen;
    homeTutorialController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:homeTutorialController animated:YES completion:^{
        [homeTutorialController setAnimations:@[
                                                @{@"text":@"Here is the Clock",
                                                  @"textCenter":[NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.view.frame), 300)],
                                                  @"holeRadius":@(60),
                                                  @"holeCenter":[NSValue valueWithCGPoint:CGPointMake(120, 150)]},
                                                @{@"text":@"The App Store",
                                                  @"textCenter":[NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.view.frame), 50)],
                                                  @"holeRadius":@(30),
                                                  @"holeCenter":[NSValue valueWithCGPoint:CGPointMake(200, 320)]},
                                                @{@"text":@"And Mail",
                                                  @"textCenter":[NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.view.frame), 100)],
                                                  @"holeRadius":@(30),
                                                  @"holeCenter":[NSValue valueWithCGPoint:CGPointMake(120, self.view.frame.size.height-50)]}
                                                ]];
        
        [homeTutorialController setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.7]];
        [homeTutorialController setExplanationLabelFont:[UIFont fontWithName:@"Source Sans Pro" size:15]];
        [homeTutorialController displayTutorial];
    }];
}

@end
