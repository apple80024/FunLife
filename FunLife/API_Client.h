//
//  API_Client.h
//  FunLife
//
//  Created by Brian Chen on 2015/7/25.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface API_Client : AFHTTPSessionManager

+(instancetype)SharedClient;

@end
