//
//  TMDatePickerViewController.m
//  Task Manager
//
//  Created by AmitKumar on 10/12/14.
//  Copyright (c) 2014 RakeshKumar. All rights reserved.
//

#import "TMDatePickerViewController.h"


@interface TMDatePickerViewController ()

@end

@implementation TMDatePickerViewController
@synthesize thedatedelegate,inputdate;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view addSubview:self.DatePickerView];
    self.DatePickerView.center=self.view.center;
    
    
     df=[[NSDateFormatter alloc]init];
    
    [df setDateFormat:@"EEEE"];
    [df stringFromDate:self.inputdate];
    
    self.DayLabel.text=[[df stringFromDate:self.inputdate] uppercaseString];
    
    [df setDateFormat:@"yyyy"];
    self.YearLabel.text=[df stringFromDate:self.inputdate];
    
    
    [df setDateFormat:@"MMMM"];
    self.MonthLabel.text=[[df stringFromDate:self.inputdate] uppercaseString];
    
    
    [df setDateFormat:@"dd"];
    self.DayNumberLabel.text=[df stringFromDate:self.inputdate];
    
    [self setcaleView];
    
    
    [self.donebtn addTarget:self action:@selector(highlightaction:) forControlEvents:UIControlEventTouchDown];
    [self.donebtn addTarget:self action:@selector(highlightactioncancel:) forControlEvents:UIControlEventTouchUpOutside];

    
    
}
-(void)highlightaction:(UIButton *)sender{
    
    [self.donebtn setBackgroundColor:[UIColor blueColor]];
}
-(void)highlightactioncancel:(UIButton *)sender{
    
    [self.donebtn setBackgroundColor:[UIColor clearColor]];
}
-(void)setcaleView{
    
    TSQCalendarView *calendarView = [[TSQCalendarView alloc] initWithFrame:self.CalViewOutlet.frame];
    calendarView.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    calendarView.rowCellClass = [TSQTACalendarRowCell class];
    calendarView.firstDate = [NSDate dateWithTimeIntervalSinceNow:-60 * 60 * 24 * 365 * 1];
    calendarView.lastDate = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 24 * 365 * 5];
    calendarView.backgroundColor = [UIColor colorWithRed:0.84f green:0.85f blue:0.86f alpha:1.0f];
    calendarView.pagingEnabled = YES;
    CGFloat onePixel = 1.0f / [UIScreen mainScreen].scale;
    calendarView.contentInset = UIEdgeInsetsMake(0.0f, onePixel, 0.0f, onePixel);
    calendarView.delegate=self;
     calendarView.selectedDate=self.inputdate;
    [self.DatePickerView  addSubview: calendarView];
    
    [calendarView scrollToDate:self.inputdate animated:YES];
    
    
    self.DatePickerView.transform=CGAffineTransformMakeScale(.8, .8);
    self.DatePickerView.center=self.view.center;
    
    if (IS_IPHONE_6 ) {
        self.DatePickerView.transform=CGAffineTransformMakeScale(1, 1);
        self.DatePickerView.transform=CGAffineTransformMakeTranslation(25, 15);
        self.DatePickerView.center=self.view.center;
    }
    if (IS_IPHONE_6P ) {
        self.DatePickerView.transform=CGAffineTransformMakeScale(1, 1);
        self.DatePickerView.transform=CGAffineTransformMakeTranslation(50, 15);
        self.DatePickerView.center=self.view.center;
    }
    if (IS_IPHONE_4_OR_LESS ) {
        //self.DatePickerView.center=self.view.center;
//        self.DatePickerView.transform=CGAffineTransformMakeTranslation(0, -100);
        self.DatePickerView.transform=CGAffineTransformMakeScale(.7, .7);
        CGRect temp=self.DatePickerView.frame;
        temp.origin.y=20;
        self.DatePickerView.frame=temp;
//
        
    }
    
    

    
}
- (void)calendarView:(TSQCalendarView *)calendarView didSelectDate:(NSDate *)date{
    NSLog(@"%@",date);
    
    
    
    
   
    [df setDateFormat:@"EEEE"];
    [df stringFromDate:date];
    
    self.DayLabel.text=[[df stringFromDate:date] uppercaseString];
    
    [df setDateFormat:@"yyyy"];
    self.YearLabel.text=[df stringFromDate:date];
    
    
    [df setDateFormat:@"MMMM"];
    self.MonthLabel.text=[[df stringFromDate:date] uppercaseString];
    
    
    [df setDateFormat:@"dd"];
    self.DayNumberLabel.text=[df stringFromDate:date];
    
    userselecteddate=date;
    
    
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

- (IBAction)DoneDateAction:(UIButton *)sender {
    
   
    
    
    
    
   [self.thedatedelegate userhasSelecteddate:userselecteddate];
    
}
- (IBAction)BackViewTapped:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
