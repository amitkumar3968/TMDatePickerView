//
//  ViewController.m
//  TMDatePickerView
//
//  Created by AmitKumar on 24/12/14.
//  Copyright (c) 2014 Amit kumar. All rights reserved.
//

#import "ViewController.h"




@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dateaction:(id)sender {
    
    TMDatePickerViewController *objtm=[[TMDatePickerViewController alloc] initWithNibName:@"TMDatePickerViewController" bundle:nil];
    objtm.thedatedelegate=self;
    objtm.inputdate=[NSDate date];
    [self
     presentViewController:objtm animated:YES completion:nil];
    
    
    
}

- (IBAction)timeaction:(id)sender {
    
   CustomTimePicker * clockView = [[CustomTimePicker alloc] initWithView:self.view withDarkTheme:false];
    clockView.delegate = self;
    clockView.preselectedTime=@"06:12 PM";
    [self.view addSubview:clockView];
    
    if (IS_IPHONE_5) {
        
        
        clockView.transform=CGAffineTransformMakeScale(.8, .8);
    }
    
    [clockView showPreselectedTimeIFavailable];
    
    
}

-(void)dismissClockViewWithHours:(NSString *)hours andMinutes:(NSString *)minutes andTimeMode:(NSString *)timeMode{
    
    NSLog(@"%@",[NSString stringWithFormat:@"%@:%@  %@",hours,minutes,timeMode]);
    
    
    
    
    
}


-(void)userhasSelecteddate:(NSDate *)thedate
{
    
    NSLog(@"%@",thedate);
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
