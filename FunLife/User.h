//
//  User.h
//  FunLife
//
//  Created by Brian Chen on 2015/7/25.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kUserProfileImageDidLoadNotification;

@interface User : NSObject

@property(nonatomic, readonly, assign)NSUInteger * userID;
@property(nonatomic, readonly, copy)NSString * userName;
@property(nonatomic, readonly, unsafe_unretained)NSURL * avatarImageURL;

-(instancetype) initWithAttributes:(NSDictionary *)attributes;


@end
