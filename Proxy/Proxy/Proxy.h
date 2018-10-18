//
//  Proxy.h
//  Proxy
//
//  Created by Ansel on 16/6/16.
//  Copyright © 2016年 Ansel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Handler;

@interface Proxy : NSObject

+ (instancetype)createProxyWithHandler:(Handler *)handler forProtocol:(Protocol *)procotol;

@end
