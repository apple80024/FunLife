//
//  FunManager.h
//  FunLife
//
//  Created by Brian Chen on 2015/3/18.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fun.h"

@interface FunManager : NSObject

@property Fun * selectedFun;
@property NSArray * funs;
+(FunManager *) sharedInstance;

@end
