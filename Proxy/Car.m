//
//  Person.m
//  Proxy
//
//  Created by Ansel on 16/6/16.
//  Copyright © 2016年 Ansel. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)runTo:(NSString *)address
{
    sleep(2);
    NSLog(@"car run to %@", address);
}

@end
