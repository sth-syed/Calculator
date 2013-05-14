//
//  CalcuViewController.h
//  Calcu
//
//  Created by Thahir on 1/7/13.
//  Copyright (c) 2013 Thahir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalcuViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UILabel *stack;

- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)enterPressed;
- (IBAction)operationPressed:(UIButton *)sender;

- (IBAction)ClearLabel:(UIButton *)sender;

- (IBAction)UndoPress:(id)sender;


@end
