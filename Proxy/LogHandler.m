//
//  LogHandler.m
//  Proxy
//
//  Created by Ansel on 16/6/17.
//  Copyright © 2016年 Ansel. All rights reserved.
//

#import "LogHandler.h"

@implementation LogHandler

- (void)invoker:(NSInvocation *)invocation
{
    
    NSLog(@"log start");
    
    [super invoker:invocation];
    
    NSLog(@"log end");
}

@end
