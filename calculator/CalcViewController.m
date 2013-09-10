//
//  CalcViewController.m
//  calculator
//
//  Created by Jason Koceja on 9/9/13.
//  Copyright (c) 2013 Jason Koceja. All rights reserved.
//

#import "CalcViewController.h"

@interface CalcViewController ()

@end

@implementation CalcViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self clear];
}

- (IBAction)buttonPressed:(UIButton *)sender{
    int value = sender.tag;
    [self updateDisplay:[NSNumber numberWithInt:value]];
}

- (IBAction)buttonPressedOperator:(UIButton *)sender {
    NSString *symbol;
    int buttonId = sender.tag;
    [self calculate:NO];
    switch (buttonId) {
        case 10:
            symbol = @"+";
            break;
        case 11:
            symbol = @"-";
            break;
        case 12:
            symbol = @"*";
            break;
        case 13:
            symbol = @"/";
            break;
        case 15:
            // %
            symbol = @" ";
            float percent = (self.operatingValue * (self.floatValue / 100));
            self.floatValue = percent;
            [self buttonPressedEquals:nil];
            break;
        case 1:
            // =
            symbol = @" ";
            [self calculate:YES];
            break;
        default:
            break;
    }
    self.operatorSelected = buttonId;
    self.operatorLabel.text = symbol;
}


- (IBAction)buttonPressedClear:(id)sender {
    [self clear];
}

- (IBAction)buttonPressedEquals:(UIButton *)sender {
    [self calculate:YES];
    self.floatValue = self.operatingValue;
    NSString *valueString = [NSString stringWithFormat:@"%0.1f",self.floatValue];
    self.displayLabel.text = valueString;
    self.floatValue = 0.0;
    self.operatingValue = 0.0;
    self.operatorSelected = 0;
}

- (void)calculate:(BOOL)equals{
    // perform calculation
    if(self.operatingValue > 0.0){
        if(self.operatorSelected > 0){
            switch (self.operatorSelected) {
                case 10:
                    //                symbol = @"+";
                    self.operatingValue += self.floatValue;
                    self.floatValue = 0.0;
                    self.operatorSelected = 1;
                    break;
                case 11:
                    //                symbol = @"-";
                    if(self.floatValue < self.operatingValue){
                        self.operatingValue -= self.floatValue;
                        self.floatValue = 0.0;
                        self.operatorSelected = 1;
                    }
                    break;
                case 12:
                    //                symbol = @"*";
                    self.operatingValue *= self.floatValue;
                    self.floatValue = 0.0;
                    self.operatorSelected = 1;
                    break;
                case 13:
                    //                symbol = @"/";
                    if(self.floatValue > 0){
                        self.operatingValue /= self.floatValue;
                        self.floatValue = 0.0;
                        self.operatorSelected = 1;
                    }
                    break;
                default:
                    break;
                    
                    if(equals){
                        [self calculate:NO];
                    }
            }
        }
    }else{
        self.operatingValue = self.floatValue;
        self.floatValue = 0.0;
    }
    //    [self updateDisplay:[NSNumber numberWithFloat:self.operatingValue]];
    self.floatValue = 0.0;
    //    NSLog(@"Total: %f", self.operatingValue);
    
}

- (void)updateDisplay:(NSNumber *)number{
    float digit = [number floatValue];
    float val = 999999.0;
    if (self.floatValue < val) {
        [self digitEntered:digit];
    }
    // update the label displayed to user
    NSString *valueString = [NSString stringWithFormat:@"%0.1f",self.floatValue];
    //    NSLog(@"currentValue: %@", valueString);
    self.displayLabel.text = valueString;
    
}

- (BOOL)digitEntered:(float)digit{
    float val = self.floatValue * 10;
    val += digit;
    self.floatValue = val;
    return YES;
}

- (void)clear{
    self.floatValue = 0.0;
    self.operatingValue = 0.0;
    self.operatorSelected = 0;
    [self updateDisplay:[NSNumber numberWithFloat:self.floatValue]];
}

@end
