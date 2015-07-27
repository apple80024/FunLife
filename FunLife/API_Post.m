//
//  API_Post.m
//  FunLife
//
//  Created by Brian Chen on 2015/7/25.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import "API_Post.h"
#import "User.h"
#import "API_Client.h"

@implementation API_Post

-(instancetype)initWithAttributes:(NSDictionary *)attributes{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.postID = (NSUInteger *)[[attributes valueForKeyPath:@"id"] integerValue];
    self.text = [attributes valueForKeyPath:@"text"];
    
    self.user = [[User alloc] initWithAttributes:[attributes valueForKeyPath:@"user"]];
    return self;
}

+(NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *, NSError *))block{
    return [[API_Client SharedClient] GET:@"stream/0/posts/stream/global" parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSArray * postsFromResponse = [JSON valueForKey:@"data"];
        NSMutableArray * mutablePosts = [[NSMutableArray alloc]initWithCapacity:[postsFromResponse count]];
        for (NSDictionary * attributes in postsFromResponse) {
            API_Post * post = [[API_Post alloc]initWithAttributes:attributes];
            [mutablePosts addObject:post];
        }
        if (block) {
            block([NSArray arrayWithArray:mutablePosts], nil);
        }
        
    } failure:^(NSURLSessionDataTask * __unused task, NSError * error){
        if (block) {
            block([NSArray array], error);
        }
    }];
}

@end
