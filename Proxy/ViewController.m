//
//  ViewController.m
//  Proxy
//
//  Created by Ansel on 16/6/16.
//  Copyright © 2016年 Ansel. All rights reserved.
//

#import "ViewController.h"

#import "Movable.h"
#import "Car.h"
#import "TimeHandler.h"
#import "Proxy.h"
#import "LogHandler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Car *car = [[Car alloc] init];
    TimeHandler *timeHandler = [[TimeHandler alloc] initWithTarget:car];
    id <Movable> timeM = (id <Movable>)[Proxy createProxyWithHandler:timeHandler forProtocol:@protocol(Movable)];
    
    LogHandler *logHandler = [[LogHandler alloc] initWithTarget:timeM];
    id <Movable> logM = (id <Movable>)[Proxy createProxyWithHandler:logHandler forProtocol:@protocol(Movable)];
    
    [logM runTo:@"sz"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
