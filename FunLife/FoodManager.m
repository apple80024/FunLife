//
//  FoodManager.m
//  FunLife
//
//  Created by Brian Chen on 2015/3/18.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import "FoodManager.h"

@implementation FoodManager

static FoodManager * foodmanager;

+(FoodManager *) sharedInstance{
    
    if(foodmanager==nil){
        
    foodmanager = [[FoodManager alloc]init];
    
    }
    return foodmanager;
}

@end
