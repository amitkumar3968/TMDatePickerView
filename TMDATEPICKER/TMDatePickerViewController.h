//
//  TMDatePickerViewController.h
//  Task Manager
//
//  Created by AmitKumar on 10/12/14.
//  Copyright (c) 2014 RakeshKumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSQTACalendarRowCell.h"
 
#import "TimesSquare.h"


@protocol TMDatePickerProtocol <NSObject>

-(void)userhasSelecteddate:(NSDate *)thedate;

@end

@interface TMDatePickerViewController : UIViewController<TSQCalendarViewDelegate>

{
    NSDateFormatter *df;
    NSDate *userselecteddate;
}


@property (strong, nonatomic) IBOutlet UIButton *donebtn;
@property(nonatomic,strong)NSDate *inputdate;
@property(nonatomic,assign)id<TMDatePickerProtocol> thedatedelegate;
- (IBAction)BackViewTapped:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *DatePickerView;

@property (strong, nonatomic) IBOutlet UILabel *DayLabel;

@property (strong, nonatomic) IBOutlet UILabel *MonthLabel;
@property (strong, nonatomic) IBOutlet UILabel *DayNumberLabel;

@property (strong, nonatomic) IBOutlet UILabel *YearLabel;

@property (strong, nonatomic) IBOutlet UIButton *DoneOutlet;
- (IBAction)DoneDateAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *CalViewOutlet;




@end
