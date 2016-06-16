//
//  Handle.h
//  Proxy
//
//  Created by Ansel on 16/6/16.
//  Copyright © 2016年 Ansel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Handler : NSObject

- (instancetype)initWithTarget:(id)target;

- (void)invoker:(NSInvocation *)invocation;

@end
