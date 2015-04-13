//
//  MainTableViewCell.h
//  ImFine_storyboard_samples
//
//  Created by NEXT-19 on 2015. 4. 7..
//  Copyright (c) 2015년 yunseo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *colorTagView;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *moreInfoButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@end
