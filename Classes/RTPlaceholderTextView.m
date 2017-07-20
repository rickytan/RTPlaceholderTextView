//
//  RTPlaceholderTextView.m
//  RTPlaceholderTextView
//
//  Created by ricky on 14-3-13.
//  Copyright (c) 2014年 ricky. All rights reserved.
//

#import "RTPlaceholderTextView.h"

@implementation RTPlaceholderTextView

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
}

- (void)commonInit
{
    self.placeholderTextColor = [UIColor lightGrayColor];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(setNeedsDisplay)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
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

- (void)setPlaceholderText:(NSString *)placeholderText
{
    if (![_placeholderText isEqualToString:placeholderText]) {
        _placeholderText = placeholderText;
        [self setNeedsDisplay];
    }
}

- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor
{
    if (![_placeholderTextColor isEqual:placeholderTextColor]) {
        _placeholderTextColor = placeholderTextColor;
        [self setNeedsDisplay];
    }
}

- (void)setText:(NSString *)text
{
    super.text = text;
    [self setNeedsDisplay];
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    super.attributedText = attributedText;
    [self setNeedsDisplay];
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
        NSMutableDictionary *attr = [self.typingAttributes ?: @{} mutableCopy];
        attr[NSForegroundColorAttributeName] = self.placeholderTextColor;
        if (!attr[NSFontAttributeName]) {
            attr[NSFontAttributeName] = self.font;
        }
        [self.placeholderText drawInRect:UIEdgeInsetsInsetRect(UIEdgeInsetsInsetRect(rect, self.contentInset), inset)
                          withAttributes:attr];
#else
        [self.placeholderTextColor set];
        [self.placeholderText drawInRect:UIEdgeInsetsInsetRect(UIEdgeInsetsInsetRect(rect, self.contentInset), inset)
                                withFont:self.font];
#endif
    }
}

@end
