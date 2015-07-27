//
//  API_Client.m
//  FunLife
//
//  Created by Brian Chen on 2015/7/25.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import "API_Client.h"

@implementation API_Client

static NSString * const API_BaseURL_String = @"https://api.app.net/";

+(instancetype)SharedClient{
    
    static API_Client * _shareClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _shareClient = [[API_Client alloc]initWithBaseURL:[NSURL URLWithString:API_BaseURL_String]];
        
        _shareClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];

    });
    return _shareClient;
}
@end
