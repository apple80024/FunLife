//
//  API_Post.h
//  FunLife
//
//  Created by Brian Chen on 2015/7/25.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@class User;

@interface API_Post : NSObject

@property (nonatomic, assign) NSUInteger * postID;
@property (nonatomic, strong) NSString * text;
@property (nonatomic, strong) User * user;

-(instancetype)initWithAttributes:(NSDictionary *)attributes;

+(NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block;

@end
