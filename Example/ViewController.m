//
//  ViewController.m
//  Example
//
//  Created by maxfong on 2017/4/27.
//  Copyright © 2017年 maxfong. All rights reserved.
//

#import "ViewController.h"
#import "AClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [AClass doSomething];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
