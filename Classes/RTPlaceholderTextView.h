//
//  RTPlaceholderTextView.h
//  RTPlaceholderTextView
//
//  Created by ricky on 14-3-13.
//  Copyright (c) 2014年 ricky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTPlaceholderTextView : UITextView
@property (nonatomic, strong) NSString * placeholderText;
@property (nonatomic, strong) UIColor  * placeholderTextColor;   // Default lightGray
@end
