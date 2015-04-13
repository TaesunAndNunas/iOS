//
//  RegisterIDModel.h
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 8..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegisterIDViewController.h"

@interface RegisterIDModel : NSObject
{
    RegisterIDViewController* newController;
    NSURL* newURL;
    NSMutableURLRequest * newRequest;
    NSData * resultData;
    NSString * registerData;
}
@end
