//
//  AMViewController.m
//  BullsEye
//
//  Created by Carli Lessard on 9/2/14.
//  Copyright (c) 2014 Alejandro Mendoza. All rights reserved.
//

#import "AMViewController.h"

@interface AMViewController ()

@end

@implementation AMViewController
{
    int _currentValue;
    int _targetValue;
    int _score;
    int _round;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self startNewGame];
    [self updateLabels];
    
    UIImage *thumbImageNormal = [UIImage
                                 imageNamed:@"SliderThumb-Normal"];
    
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    UIImage *trackRightImage =
    [[UIImage imageNamed:@"SliderTrackRight"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert;
{
    int difference = abs(_targetValue - _currentValue);
    int points = 100 - difference;
    _score += points;
    
    NSString *title;
    if (difference == 0)
    {
        title = @"Perfect";
        points += 100;
    }
    else if (difference < 5)
    {
        title = @"Almost there";
        if (difference == 1) {
            points += 50;
        }
    }
    else if (difference < 10)
    {
        title = @"Pretty good";
        
    }
    else {
        title = @"Not even close";
    }
    
    NSString *message = [NSString stringWithFormat:
                         @"You scored %d points",
                         points];
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:title
                              message:message
                              delegate:self
                              cancelButtonTitle:@"Ok"
                              otherButtonTitles:nil];
    
    [alertView show];
    
    [self startNewRound];
    [self updateLabels];
}

- (IBAction)sliderMoved:(UISlider *)slider
{
    _currentValue = lroundf(slider.value);
    
}

- (void)startNewRound
{
    _round += 1;
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = 50;
    self.slider.value = _currentValue;
    
}

- (void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", _targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", _score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", _round];
}

- (void)startOver
{
    [self startNewGame];
    [self updateLabels];
}

- (void)startNewGame
{
    _round = 0;
    _score = 0;
    [self startNewRound];
}

- (BOOL)prefersStatusBarHidden {
    return YES; }




@end
