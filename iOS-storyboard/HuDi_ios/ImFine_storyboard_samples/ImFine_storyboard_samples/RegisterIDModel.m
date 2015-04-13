//
//  RegisterIDModel.m
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 8..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import "RegisterIDModel.h"

@implementation RegisterIDModel

- (id) init {
    
    self = [super init];
    if (self) {
        newController = [[RegisterIDViewController alloc]init];
    }
    return self;
}

- (id) initWithURLWithPort:(NSString*)URL port:(NSString*)port {
    
    if ([super init]) {
        NSString* serverAddress = [NSString stringWithFormat:@"http://%@:%@", URL, port];
        newURL = [[NSURL alloc]initWithString:serverAddress];
        newRequest = [[NSMutableURLRequest alloc]initWithURL:newURL];
        newRequest.HTTPMethod = @"POST";
    }
    return self;
}

- (BOOL) checkDuplicationUserID:(NSString*)userID {
    [newRequest setURL:[newURL URLByAppendingPathComponent:@"/register/userID"]];
    
}

@end
