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
//@synthesize chkoperation = _chkoperation;

- (NSMutableArray *)programStack
{
    if (_programStack == nil) _programStack = [[NSMutableArray alloc] init];
    return _programStack;
}

-(void) pushOperand:(double)operand
{
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
    
}

-(double)performOperation:(NSString *)operation
{
    // check for clear
    [self.programStack addObject:operation];
    return [CalcuBrain runProgram:self.program];
    
}

-(void)clearOperand
{
    [self.programStack removeAllObjects];
    return;
}

-(void)pushvariable:(NSString *) variable {
    [self.programStack addObject:variable];
}

- (id)program
{
    return [self.programStack copy];
}

+ (BOOL) isOperation:(id) name{
    if([name isKindOfClass:[NSString class]]){
        NSSet *_chkoperation = [NSSet setWithObjects:@"+", @"-", @"*", @"/", @"Sin", @"Cos", @"sqrt", @"π", nil];
        return [_chkoperation containsObject:name];
    }
    else{
        return NO;
    }
}

+ (void) pushOperandToStack:(NSMutableArray *)stack{
    
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
        return [topOfStack doubleValue];
        NSLog(@"Result No=%g",result);
    }
    else if ([topOfStack isKindOfClass:[NSString class]])
    {
        NSString *operation = topOfStack;
        // Perform Operation

        NSLog(@"Operation Selected=%@",topOfStack);
        if ([@"π" isEqualToString:operation])
        {
            
            result = M_PI;
        }
        
        else if ([@"sqrt" isEqualToString:operation])
        {
            
            result=sqrt([self popOperandOffStack:stack]);
            
        }
        
        else if ([@"Sin" isEqualToString:operation])
        {
            result = sin([self popOperandOffStack:stack]);
        }
        
        else if ([@"Cos" isEqualToString:operation])
        {
            result = cos([self popOperandOffStack:stack]);
        }
        // remove this
        else if ([@"C" isEqualToString:operation])
        {
            //[self clearOperand] ;
            return 0;
        }
        
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

    }

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

+ (double)runProgram:(id)program usingVariableValues:(NSDictionary *)variableValues
{
    // 1- Change the program array to mutible
    // 2- Check if there is variables is used
    // 3- If there are varibale replace them with values from variableValues
    // 4- runProgram and return the result
    
    NSMutableArray *stack;
    stack= [program mutableCopy];
    
    return 0;
}

+ (NSNumber *) valueForVriable:(NSString *) name from:(NSDictionary *)variableValues{
    // 1- find the vriable name in the dictionary
    // 2- If variable name is found return the NSNumber object
    // 3- Else return NSNumber with value zero
}

+ (void) replaceProgram:(id) program variable:(NSString *) name withValue:(NSNumber *) value{
    // 1- go over the program and if the variable name is found replace it with the value provided
}

+(NSSet *)variablesUsedInProgram:(id)program{
    // 1- Create empty NSMutableSet
    // 2- Go in the program array
    // 3- If there is an NSString that is not an operation or NSNumber add it to NSSet
    // 4- If NSSet is more than zero return it else return nil
    NSMutableSet *chkVar = [[NSMutableSet alloc] init];
    for(NSObject *item in program){
        if(![CalcuBrain isOperation:item]){
            if(![item isKindOfClass:[NSNumber class]]){
                [chkVar addObject:item];
            }
        }
    }
    if([chkVar count] > 0){
        return [chkVar copy];
    }
    else{
        return nil;
    }
}

+ (NSString *)descriptionOfProgram:(id)program
{
    return @"";
}


@end
