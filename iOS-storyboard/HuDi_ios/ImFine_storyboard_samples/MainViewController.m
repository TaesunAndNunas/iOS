//
//  MainViewController.m
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 6..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *MainLabel1;
@property (weak, nonatomic) IBOutlet UILabel *MainLabel2;
@property (weak, nonatomic) IBOutlet UILabel *MainLabel3;
@property (weak, nonatomic) IBOutlet UILabel *MainLabel4;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)MainButton1:(id)sender {
    NSDate* now = [NSDate date];
    NSDateFormatter* hourAndMin = [[NSDateFormatter alloc]init];
    
    [hourAndMin setDateFormat:@"HH:mm"];
    
    NSString* actionTime = [hourAndMin stringFromDate:now];
    _MainLabel1.text = actionTime;

    
}
- (IBAction)MainButton2:(id)sender {
}
- (IBAction)MainButton3:(id)sender {
}

@end

// 4개 버튼 클릭시 라벨에 1일기준 횟수, 마지막 시간 띄우기, 테이블 셀 추가