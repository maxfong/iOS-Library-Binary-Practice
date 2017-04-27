//
//  AClass.m
//  iOSBinaryPractice
//
//  Created by maxfong on 2017/4/27.
//  Copyright © 2017年 maxfong. All rights reserved.
//

#import "AClass.h"
#import <MFSIdentifier/MFSIdentifier.h>

@implementation AClass

+ (void)doSomething {
    NSLog(@"call iOSBinaryPractice AClass -doSomething");
    
    NSString *deviceID = [MFSIdentifier deviceID];
    NSLog(@"deviceID is: %@", deviceID);
}

@end
