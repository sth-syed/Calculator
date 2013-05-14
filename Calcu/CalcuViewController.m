//
//  CalcuViewController.m
//  Calcu
//
//  Created by Thahir on 1/7/13.
//  Copyright (c) 2013 Thahir. All rights reserved.
//

#import "CalcuViewController.h"
#import "CalcuBrain.h"

@interface CalcuViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalcuBrain *brain;
@end

@implementation CalcuViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber=_userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;



-(CalcuBrain *)brain
{
    if (!_brain) _brain = [[CalcuBrain alloc] init];
    return _brain;
}

//- (IBAction)digitPressed:(UIButton *)sender

//{
//    NSString *digit = sender.currentTitle;
  //  if (self.userIsInTheMiddleOfEnteringANumber)
    //{
      //  self.display.text=[self.display.text stringByAppendingString:digit];
    //}
    //else
    //{
      //  self.display.text=digit;
        ////self.digi=digit;
      
        //self.userIsInTheMiddleOfEnteringANumber = YES;
    //}
    
//}

-(IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = sender.currentTitle;
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
        //self.display.text = [self.display.text stringByAppendingString:digit];
        if (! [self.display.text isEqual:@"."]) 
        {
             self.display.text=[self.display.text stringByAppendingString:digit];
            
        }
    }
    else
    {
        if ([digit isEqual:@"."])
        {
            [self.display setText: @"0."];
            //[display setText: @"0."];
            
        }
        else
        {
            [self.display setText: digit];
        }

    }
    self.userIsInTheMiddleOfEnteringANumber = YES;
}

- (IBAction)enterPressed
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.stack.text = [NSString stringWithFormat:@"%@ %@",self.stack.text,self.display.text];
    
    //self.stack.text= [NSString stringWithFormat:@"%@ %@",self.stack.text,@"sth"];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}


- (IBAction)operationPressed:(UIButton *)sender
{
    if (self.userIsInTheMiddleOfEnteringANumber) [self enterPressed];
    
    double result = [self.brain performOperation:sender.currentTitle];
    //double result = self.enterPressed;
    //self.oprpress.text=[NSString stringWithFormat:@"%g", 0];
    NSLog(@"result = %g",result);
     
    self.display.text = [NSString stringWithFormat:@"%g", result];
    //
    NSString *opr = [sender currentTitle];
    self.stack.text = [self.stack.text stringByAppendingString:@" "];
    self.stack.text = [self.stack.text stringByAppendingString:opr];
    
}

- (IBAction)ClearLabel:(UIButton *)sender {
    //self.stack.text=nil;
    self.stack.text=@"";
    self.userIsInTheMiddleOfEnteringANumber=NO;
}

- (IBAction)UndoPress:(id)sender
{
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
        self.display.text=[self.display.text substringToIndex:[self.display.text length] -1];
        
    }
}




@end
