//
//  LoginModel.m
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 7..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel
{
    @public
    NSMutableData* data;
    NSMutableURLRequest* request;
    NSURL* serverURL;
}

- (id) initWithURLwithPORT:(NSString*)URL port:(NSString*)port{
    if ([super init]) {
        serverURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@:%@", URL, port]];
        request = [[NSMutableURLRequest alloc]init];
        [request setHTTPMethod:@"POST"];
        // application/x-www-form-urlencoded 방식: key-value 형식으로 인코딩
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    }
    return self;
}

// 사용자 아이디와 패스워드를 post data로 전송함
// 비밀번호는 sha1함수를 이용하여 encrypt로 변환함
- (void) login:(NSString*)userID password:(NSString*)userPassword {
    userPassword = [self sha1:userPassword];
    NSString* userData = [[NSString alloc] initWithFormat:@"userID = %@ & userPassword = %@",
                          userID, userPassword];
    NSData* postData = [userData dataUsingEncoding:NSUTF8StringEncoding];
    NSString* dataLength = [NSString stringWithFormat:@"%lu", (unsigned long) [postData length]];
    [request setURL:[serverURL URLByAppendingPathComponent:@"/login"]];
    [request setValue:dataLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    NSURLConnection* connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    if (connection) {
        NSLog(@"connection success");
    } else {
        NSLog(@"connection fail");
    }
}

// sha1은 암호화 방식 CommonDigest.h를 임포트함
- (NSString*) sha1:(NSString*)input {
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData* data = [NSData dataWithBytes:cstr length:input.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, data.length, digest);
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

@end
