//
//  WebAPI.h
//  FunLife
//
//  Created by Brian Chen on 2015/3/20.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebAPI : NSObject

+(NSData*)getDataFrom:(NSString*)url;

@end
