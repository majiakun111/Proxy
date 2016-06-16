//
//  Protocol.h
//  Proxy
//
//  Created by Ansel on 16/6/16.
//  Copyright © 2016年 Ansel. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Movable <NSObject>

- (void)runTo:(NSString *)address;

@end