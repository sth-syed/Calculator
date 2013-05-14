//
//  CalcuBrain.h
//  Calcu
//
//  Created by Thahir on 1/8/13.
//  Copyright (c) 2013 Thahir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalcuBrain : NSObject

-(void) pushOperand:(double)operand;
-(double)performOperation:(NSString *)operation;
@property (readonly) id program;
+ (double)runProgram:(id)program;
+ (NSString *)descriptionOfProgram:(id)program;
+ (double)runProgram:(id)program usingVariableValues:(NSDictionary *)variableValues;
+(NSSet *)variablesUsedInProgram:(id)program;

@end
