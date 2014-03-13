//
//  RTViewController.m
//  RTPlaceholderTextView
//
//  Created by ricky on 14-3-13.
//  Copyright (c) 2014年 ricky. All rights reserved.
//

#import "RTViewController.h"

@interface RTViewController ()
- (IBAction)onDismiss:(id)sender;
@end

@implementation RTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDismiss:(id)sender
{
    [self.view endEditing:YES];
}

@end
