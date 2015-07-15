# MHBlurTutorials

[![CI Status](http://img.shields.io/travis/Mathilde Henriot/MHBlurTutorials.svg?style=flat)](https://travis-ci.org/Mathilde Henriot/MHBlurTutorials)
[![Version](https://img.shields.io/cocoapods/v/MHBlurTutorials.svg?style=flat)](http://cocoapods.org/pods/MHBlurTutorials)
[![License](https://img.shields.io/cocoapods/l/MHBlurTutorials.svg?style=flat)](http://cocoapods.org/pods/MHBlurTutorials)
[![Platform](https://img.shields.io/cocoapods/p/MHBlurTutorials.svg?style=flat)](http://cocoapods.org/pods/MHBlurTutorials)

MHBlurTutorials allows you to highlight some elements and display explanation text

[!Screenshot](http://i.imgur.com/ZClWBXg.png)

## Version

0.1.2

## Installation

MHBlurTutorials is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MHBlurTutorials"
```

## Usage

Import the library where you need it.
```ruby
#import <MHBlurTutorialsViewController.h>
```

Then you can create your tutorials like this :
```ruby
MHBlurTutorialsViewController *homeTutorialController = [[MHBlurTutorialsViewController alloc] init];
homeTutorialController.modalPresentationStyle = UIModalPresentationOverFullScreen;
homeTutorialController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

[self presentViewController:homeTutorialController animated:YES completion:^{
    [homeTutorialController setAnimations:@[
            @{
                @"text":@"Explanation Text",
                @"textCenter":[NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.view.frame), 300)],
                @"holeRadius":@(60),
                @"holeCenter":[NSValue valueWithCGPoint:CGPointMake(120, 150)]
            },
            
            ...
    ]

    [homeTutorialController setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [homeTutorialController setExplanationLabelFont:[UIFont fontWithName:@"Source Sans Pro" size:15]];
    [homeTutorialController displayTutorial];
];

```

## Author

Mathilde Henriot, me@mathilde-henriot.com

## License

MHBlurTutorials is available under the MIT license. See the LICENSE file for more info.
