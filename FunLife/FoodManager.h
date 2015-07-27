//
//  FoodManager.h
//  FunLife
//
//  Created by Brian Chen on 2015/3/18.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Food.h"

@interface FoodManager : NSObject

@property Food * selectedFood;
@property NSArray * foods;

+(FoodManager *)sharedInstance;

@end
