//
//  AMViewController.h
//  BullsEye
//
//  Created by Carli Lessard on 9/2/14.
//  Copyright (c) 2014 Alejandro Mendoza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *targetLabel;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *roundLabel;

- (IBAction)showAlert;
- (IBAction)sliderMoved:(UISlider *)slider;
- (IBAction)startOver;

@end
