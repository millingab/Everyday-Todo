//
//  GLTaskModel.m
//  Everyday Todo
//
//  Created by Gab on 2014-09-20.
//  Copyright (c) 2014 Gab Labs. All rights reserved.
//

#import "GLTaskModel.h"

@implementation GLTaskModel

-(id)init
{
    self = [self initWithData:nil];
    return self;
}

-(id)initWithData:(NSDictionary *)data
{
    self = [super init];
    
    if(self){
        self.title = data[TASK_TITLE];
        self.description = data[TASK_DESCRIPTION];
        self.date = data[TASK_DATE];
        self.completion = [data[TASK_COMPLETION] boolValue];
    }
    
    return self;
}

@end
