//
//  RegisterIDViewController.h
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 6..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterIDModel.h"

@interface RegisterIDViewController : UIViewController
{
    BOOL IDFieldBool;
    BOOL nameFieldBool;
    BOOL birthFieldBool;
}
@property (strong, nonatomic) IBOutlet UITextField *userIDField;
@property (strong, nonatomic) IBOutlet UITextField *userPassword1Field;
@property (strong, nonatomic) IBOutlet UITextField *userPassword2Field;
@property (strong, nonatomic) IBOutlet UITextField *userNameField;
@property (strong, nonatomic) IBOutlet UITextField *userBirthField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *userSexSegmented;
@property (strong, nonatomic) IBOutlet UILabel *errorLabel;

@end
