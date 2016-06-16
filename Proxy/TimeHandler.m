//
//  TimeHandle.m
//  Proxy
//
//  Created by Ansel on 16/6/16.
//  Copyright © 2016年 Ansel. All rights reserved.
//

#import "TimeHandler.h"

@implementation TimeHandler

- (void)invoker:(NSInvocation *)invocation;
{
    NSTimeInterval start = [[NSDate date] timeIntervalSince1970];
    
    [super invoker:invocation];
    
    NSTimeInterval end = [[NSDate date] timeIntervalSince1970];

    NSLog(@"time is %d", (int)(end - start));
}

@end
