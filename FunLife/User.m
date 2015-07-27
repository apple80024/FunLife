//
//  User.m
//  FunLife
//
//  Created by Brian Chen on 2015/7/25.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import "User.h"
#import "AFHTTPRequestOperation.h"

NSString * const kUserProfileImageDidLoadNotification = @"com.alamofire.user.profile-image.loaded";

@interface User()
@property (readwrite, nonatomic, assign) NSUInteger * userID;
@property (readwrite, nonatomic, copy) NSString * username;
@property (readwrite, nonatomic, copy) NSString * avatarImageURLString;

@end

@implementation User

-(instancetype)initWithAttributes:(NSDictionary *)attributes{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.userID = (NSUInteger *)[[attributes valueForKeyPath:@"id"] integerValue];
    
    self.username = [attributes valueForKeyPath:@"username"];
    self.avatarImageURLString = [attributes valueForKeyPath:@"avatar_image.url"];
    
    return self;
}
- (NSURL *)avatarImageURL {
    return [NSURL URLWithString:self.avatarImageURLString];
}

@end
