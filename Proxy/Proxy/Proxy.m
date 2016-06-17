//
//  Proxy.m
//  Proxy
//
//  Created by Ansel on 16/6/16.
//  Copyright © 2016年 Ansel. All rights reserved.
//

#import "Proxy.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "Handler.h"

const char *handlerKey = nil;

@implementation Proxy

static void myforwardInvocation(__unsafe_unretained NSObject *self, SEL selector, NSInvocation *invocation)
{
    Handler *handler = objc_getAssociatedObject(self, &handlerKey);
    [handler invoker:invocation];
}

+ (instancetype)createProxyWithHandler:(Handler *)handler procotolName:(NSString *)procotolName
{
    NSString *proxyName = [NSString stringWithFormat:@"%@TargetProxy%u", NSStringFromClass([handler class]), arc4random()];
    Class clazz = objc_allocateClassPair([NSObject class], [proxyName UTF8String], 0);
    if (!clazz) {
        return nil;
    }
    
    Protocol *procotol = NSProtocolFromString(procotolName);
    if (!procotol) {
        NSLog(@"%@ not exists", procotolName);
        return nil;
    }
    
    class_addProtocol(clazz, procotol);
    
    unsigned int outCount = 0;
    struct objc_method_description *methodDescriptions = protocol_copyMethodDescriptionList(procotol, YES, YES, &outCount);
    for (unsigned int index = 0 ; index < outCount; index++) {
        struct objc_method_description methodDescription = methodDescriptions[0];
        class_addMethod(clazz,methodDescription.name, _objc_msgForward, methodDescription.types);
    }
    
    class_replaceMethod(clazz, @selector(forwardInvocation:), (IMP)myforwardInvocation, "v@:@");
    
    objc_registerClassPair(clazz);
    
    id proxy = [[clazz alloc] init];
    objc_setAssociatedObject(proxy, &handlerKey, handler, OBJC_ASSOCIATION_RETAIN);
    
    return proxy;
}

@end
