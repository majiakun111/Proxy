//
//  Handle.m
//  Proxy
//
//  Created by Ansel on 16/6/16.
//  Copyright © 2016年 Ansel. All rights reserved.
//

#import "Handler.h"

@interface Handler ()

@property (nonatomic, strong) id target;

@end

@implementation Handler

- (instancetype)initWithTarget:(id)target
{
    self = [super init];
    if (self) {
        _target = target;
    }
    
    return self;
}

- (void)invoker:(NSInvocation *)invocation
{
    SEL selector = invocation.selector;
    if ([self.target respondsToSelector:selector]) {
        [invocation setTarget:self.target];
        [invocation invoke];
    }
}

@end
