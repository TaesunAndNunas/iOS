//
//  RegisterIDViewController.m
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 6..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import "RegisterIDViewController.h"

@interface RegisterIDViewController ()
{
    RegisterIDModel* newModel;
}
@end

@implementation RegisterIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    newModel = [[RegisterIDModel alloc] initWithURLwithPort:서버주소 port:포트];
//    탭부분
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


// 아이디 입력란 예외처리: EditingDidEnd 이벤트로 구현
- (IBAction)userIDEditingDidEnd:(id)sender {
    
    NSString* userID = [self.userIDField text];
    // screen up
    
    if ([userID isEqualToString:@""]) {
        self.errorLabel.text = @"아이디는 필수입력사항입니다.";
        self.errorLabel.textColor = [UIColor redColor];
        return;
    } else {
        self.errorLabel.text = @"";
    }
    
    if (![self checkUserIDValid:userID]) {
        self.errorLabel.text = @"아이디는 알파벳 소문자 또는 숫자의 조합으로 작성해 주세요";
        self.errorLabel.textColor = [UIColor redColor];
        return;
    } else {
        self.errorLabel.text = @"";
    }
    
    if (![newModel checkDuplicationUserID: userID]) {
        self.errorLabel.text = @"중복된 아이디가 존재합니다.";
        self.errorLabel.textColor = [UIColor redColor];
        return;
    } else {
        self.errorLabel.text = @"";
    }
}

// 아이디 유효판별 검사 메서드
-(BOOL) checkUserIDValid: (NSString*) userID {
    const char *tmp = [userID cStringUsingEncoding:NSUTF8StringEncoding];
    if (userID.length != strlen(tmp)) {
        return NO;
    }
    NSString *check = @"([0-9a-zA-Z_-]+)";
    NSRange match = [userID rangeOfString:check options:NSRegularExpressionSearch];
    if (NSNotFound == match.location) {
        return NO;
    }
    return YES;
}

// 아이디 중복 검사 메서드
-(void) checkDuplicationUserID: (NSString*) checkString {
    
}

// 비밀번호 입력란1 예외처리: EditingDidEnd 이벤트로 구현
- (IBAction)userPassword1EditingDidEnd:(id)sender {
    
    NSString* userPassword = [self.userPassword1Field text];
    
    if ([userPassword isEqualToString:@""]) {
        self.errorLabel.text = @"비밀번호는 필수입력사항입니다.";
        self.errorLabel.textColor = [UIColor redColor];
        return;
    } else {
        self.errorLabel.text = @"";
    }
}

// 비밀번호 입력란1 예외처리: EditingDidEnd 이벤트로 구현
- (IBAction)userPassword2EditingDidEnd:(id)sender {
    
    NSString* userPassword1 = [self.userPassword1Field text];
    NSString* userPassword2 = [self.userPassword2Field text];

    if ([userPassword2 isEqualToString:@""]) {
        self.errorLabel.text = @"비밀번호 확인은 필수입력사항입니다.";
        self.errorLabel.textColor = [UIColor redColor];
        return;
    } else {
        self.errorLabel.text = @"";
    }
    
    if (![userPassword2 isEqualToString:userPassword1]) {
        self.errorLabel.text = @"비밀번호가 일치하지 않습니다.";
        self.errorLabel.textColor = [UIColor redColor];
        return;
    } else {
        self.errorLabel.text = @"";
    }
}

// 이름 입력란 예외처리: EditingDidEnd 이벤트로 구현
- (IBAction)userNameEditingDidEnd:(id)sender {
    
    NSString* userName = [self.userNameField text];
    
    if ([userName isEqualToString:@""]) {
        self.errorLabel.text = @"아이의 이름은 필수입력사항입니다.";
        self.errorLabel.textColor = [UIColor redColor];
        return;
    } else {
        self.errorLabel.text = @"";
    }
}

// 생년월일 입력란 예외처리: EditingDidEnd 이벤트로 구현
- (IBAction)userBirthEditingDidEnd:(id)sender {
    
    NSString* userBirth = [self.userBirthField text];
    
    if ([userBirth isEqualToString:@""]) {
        self.errorLabel.text = @"아이의 생년월일은 필수입력사항입니다.";
        self.errorLabel.textColor = [UIColor redColor];
        return;
    } else {
        self.errorLabel.text = @"";
    }
}


- (IBAction)userSexSegmented:(id)sender {
    
}






@end

// 아이디 비밀번호 확인 이름 생년월일 넘김
// 성별 프로필사진 넘김
// 양식 필터링 및 얼라트
// 중복검사