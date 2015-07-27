//
//  FunManager.m
//  FunLife
//
//  Created by Brian Chen on 2015/3/18.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import "FunManager.h"

@implementation FunManager

static FunManager * funmanager;

+(FunManager *)sharedInstance{
    
    if (funmanager == nil) {
        
        funmanager = [[FunManager alloc]init];
    }
    return funmanager;
}
@end
