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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Car *car = [[Car alloc] init];
    TimeHandler *timeHandler = [[TimeHandler alloc] initWithTarget:car];
    
    id <Movable> m = (id <Movable>)[Proxy createProxyWithTarget:timeHandler procotolName:@"Movable"];
    [m runTo:@"sz"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
