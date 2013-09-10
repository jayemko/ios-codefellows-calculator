//
//  CalcViewController.h
//  calculator
//
//  Created by Jason Koceja on 9/9/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalcViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *displayLabel;
@property (strong, nonatomic) IBOutlet UILabel *operatorLabel;
@property (nonatomic, strong) NSNumber *currentValue;

@property int operatorSelected;
@property float floatValue;
@property float operatingValue;

- (IBAction)buttonPressed:(UIButton *)sender;
- (IBAction)buttonPressedClear:(UIButton *)sender;
- (IBAction)buttonPressedOperator:(UIButton *)sender;
- (IBAction)buttonPressedEquals:(UIButton *)sender;


@end
