//
//  CalcuBrain.m
//  Calcu
//
//  Created by Thahir on 1/8/13.
//  Copyright (c) 2013 Thahir. All rights reserved.
//

#import "CalcuBrain.h"

@interface CalcuBrain()
@property (nonatomic, strong) NSMutableArray *programStack;

@end

@implementation CalcuBrain

@synthesize programStack = _programStack;

- (NSMutableArray *)programStack
{
    if (_programStack == nil) _programStack = [[NSMutableArray alloc] init];
    return _programStack;
}

//- (void)setOperandStack:(NSMutableArray *)
//{
  //  _operandStack = operandStack;
//}

-(void) pushOperand:(double)operand
{
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
    
}

//-(double)popOperand
//{
  //  NSNumber *operandObject = [self.operandStack lastObject];
    //if (operandObject) [self.operandStack removeLastObject];
    //return [operandObject doubleValue];
//}

-(void)clearOperand
{
    [self.programStack removeAllObjects];
    //[self.operandStack removeAllObjects];
    return;
}


// Fr Dsplag reslt  Eter
//-(double)enterPressOpr:(NSString *)operation
//{
  //  double resultE = 0;
    //if ([operation isEqualToString:@"+"])
    //{

      //  resultE = [self popOperand] * [self popOperand];
    //}
    
    //[self pushOperand:resultE];
    
    //return resultE;
//}

- (id)program
{
    return [self.programStack copy];
}

+ (NSString *)descriptionOfProgram:(id)program
{
    return @"Implement this in Assignment";
}

+ (double)popOperandOffStack:(NSMutableArray *)stack
{
    double result=0;
    id topOfStack = [stack lastObject];
    if(topOfStack)
        [stack removeLastObject];
    
    if ([topOfStack isKindOfClass:[NSNumber class]])
    {
                NSLog(@"Result No=%@",topOfStack);
        result = [topOfStack doubleValue];
NSLog(@"Result No=%g",result);
    }
    else if ([topOfStack isKindOfClass:[NSString class]])
    {
        NSString *operation = topOfStack;
        // Perform Operation
        
        //int count = [self.operandStack count];
        //int count =
        //NSLog(@"operandStack count = %d",count);
        //double result = 0;
        //double firstOperand = [self popOperandOffStack:stack];
        //NSLog(@"firstOperand = %g",firstOperand);
        
        //if ([@"+-*/" rangeOfString:operation].location == NSNotFound) {
            // but the single operation in here
        NSLog(@"Operation Selected=%@",topOfStack);
            if ([@"π" isEqualToString:operation])
            {
                //result = popOperandOffStack:stack * 3.14;
                
                result = [self popOperandOffStack:stack] * 3.14;
            }
            
            else if ([@"sqrt" isEqualToString:operation])
            {
                
                if ([self popOperandOffStack:stack] > 0)
                {
                    result=sqrt([self popOperandOffStack:stack]);
                }
                else
                {
                    result=0;
                }
                
            }
            
            else if ([@"Sin" isEqualToString:operation])
            {
                result = sin([self popOperandOffStack:stack]);
            }
            
            else if ([@"Cos" isEqualToString:operation])
            {
                result = cos([self popOperandOffStack:stack]);
            }
            
            else if ([@"C" isEqualToString:operation])
            {
                //[self clearOperand] ;
                return 0;
            }
            
        //}
        //else {
          //  NSLog(@"We have two operand operation");
            //if(count > 1){
                //put the two operand operation in here
              //  double secondOperand = [self popOperandOffStack:stack];
                //NSLog(@"secondOperand = %g",secondOperand);
                else if ([operation isEqualToString:@"+"])
                {
                    result =  [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
                }
                
                else if ([@"*" isEqualToString:operation])
                {
                    result =  [self popOperandOffStack:stack] * [self popOperandOffStack:stack];
                }
                
                else if ([@"-" isEqualToString:operation])
                {
                    result =  [self popOperandOffStack:stack] - [self popOperandOffStack:stack];
                }
                
                else if ([@"/" isEqualToString:operation])
                {
                    result =  [self popOperandOffStack:stack] / [self popOperandOffStack:stack];
                }
            //}
            //else{
             //   NSLog(@"Only one operand for two operand operation");
               // result = firstOperand;
            //}
        //}
        NSLog(@"Inside Result=%g",result);
return result;
        // Perform Operation
    }
    NSLog(@"Outside Result=%g",result);
    return result;
}

+ (double)runProgram:(id)program
{
    NSMutableArray *stack;
    if ([program isKindOfClass:[NSArray class]])
    {
        stack=[program mutableCopy];
    }
    return [self popOperandOffStack:stack];
}

-(double)performOperation:(NSString *)operation
{
   
        [self.programStack addObject:operation];
        return [CalcuBrain runProgram:self.program];
   
    

        //[self pushOperand:result];
    
    //return result;
    
}

+ (double)runProgram:(id)program usingVariableValues:(NSDictionary *)variableValues
{
    NSLog(@"Hello");
}



@end
