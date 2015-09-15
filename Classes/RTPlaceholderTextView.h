//
//  RTPlaceholderTextView.h
//  RTPlaceholderTextView
//
//  Created by ricky on 14-3-13.
//  Copyright (c) 2014年 ricky. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface RTPlaceholderTextView : UITextView
@property (nonatomic, strong) IBInspectable NSString * placeholderText;
@property (nonatomic, strong) IBInspectable UIColor  * placeholderTextColor;   // Default lightGray
@end
