//
//  RTPlaceholderTextView.m
//  RTPlaceholderTextView
//
//  Created by ricky on 14-3-13.
//  Copyright (c) 2014年 ricky. All rights reserved.
//

#import "RTPlaceholderTextView.h"

@implementation RTPlaceholderTextView

- (void)commonInit
{
    self.placeholderTextColor = [UIColor lightGrayColor];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (BOOL)becomeFirstResponder
{
    [self setNeedsDisplay];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
    [self setNeedsDisplay];
    return [super resignFirstResponder];
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    if (self.text.length)
        [super drawRect:rect];
    else {
        if (!self.isFirstResponder) {
            [self.placeholderTextColor set];
            UIEdgeInsets inset = [UIDevice currentDevice].systemVersion.floatValue >= 7.0 ? UIEdgeInsetsMake(8, 5, 8, 5) : UIEdgeInsetsMake(8, 8, 8, 8);
            [self.placeholderText drawInRect:UIEdgeInsetsInsetRect(UIEdgeInsetsInsetRect(rect, self.contentInset), inset)
                                    withFont:self.font];
        }
    }
}

@end
