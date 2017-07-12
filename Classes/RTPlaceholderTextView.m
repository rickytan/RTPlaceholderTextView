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
    if (self.text.length)
        [super drawRect:rect];
    else {
        UIEdgeInsets inset = UIEdgeInsetsMake(8, 8, 8, 8);
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
        if ([self respondsToSelector:@selector(textContainerInset)]) {
            inset = self.textContainerInset;
            inset.left += self.textContainer.lineFragmentPadding;
            inset.right += self.textContainer.lineFragmentPadding;
        }
        [self.placeholderText drawInRect:UIEdgeInsetsInsetRect(UIEdgeInsetsInsetRect(rect, self.contentInset), inset)
                          withAttributes:@{NSFontAttributeName: self.font,
                                           NSForegroundColorAttributeName: self.placeholderTextColor}];
#else
        [self.placeholderTextColor set];
        [self.placeholderText drawInRect:UIEdgeInsetsInsetRect(UIEdgeInsetsInsetRect(rect, self.contentInset), inset)
                                withFont:self.font];
#endif
    }
}

@end
