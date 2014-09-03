//
//  CCADefaultViewCell.m
//  CaltechCares
//
//  Created by Megan Keehan on 8/3/14.
//  Copyright (c) 2014 Megan Keehan. All rights reserved.
//

#import "CCADefaultViewCell.h"

@interface CCADefaultViewCell ()

@property (nonatomic, strong) UIView *dot;
@property (nonatomic, strong) UITextView *textView;

@end

@implementation CCADefaultViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.dot = [[UIView alloc] init];
        self.dot.backgroundColor = [UIColor colorFromHexString:CALTECH_COLOR];
        [self.dot setFrame:CGRectMake(11, 11, 8, 8)];
        self.dot.layer.cornerRadius = 4.0;
        self.dot.clipsToBounds = YES;
        [self.contentView addSubview:self.dot];
        
        self.textView = [[UITextView alloc] init];
        self.textView.dataDetectorTypes = UIDataDetectorTypeAll;
        self.textView.textContainer.lineBreakMode = NSLineBreakByWordWrapping;
        self.textView.editable = NO;
        self.textView.scrollEnabled = NO;
        [self.contentView addSubview:self.textView];
    }
    return self;
}

- (void)setData:(NSString *)data
{
    int index = [CCADefaultViewCell getIndex:data];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    
    if (index == 0)
    {
        self.dot.hidden = YES;
        [self.textView setText:data];
        [self.textView setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        [self.textView setFrame:CGRectMake(5, 0, screenWidth - 25, [self.textView sizeThatFits:CGSizeMake(screenWidth - 25, FLT_MAX)].height)];
    }
    else if (index == 1)
    {
        self.dot.hidden = YES;
        [self.textView setText:[data substringFromIndex:1]];
        [self.textView setFont:[UIFont fontWithName:@"Helvetica-bold" size:19]];
        [self.textView setFrame:CGRectMake(5, 0, screenWidth - 25, [self.textView sizeThatFits:CGSizeMake(screenWidth - 25, FLT_MAX)].height)];
    }
    else if (index == 2)
    {
        self.dot.hidden = NO;
        [self.textView setText:[data substringFromIndex:1]];
        [self.textView setFont:[UIFont fontWithName:@"Helvetica" size:15]];
        
        [self.textView setFrame:CGRectMake(30, 0, screenWidth - 50, [self.textView sizeThatFits:CGSizeMake(screenWidth - 50, FLT_MAX)].height)];
    }
}

+ (CGFloat)getRowHeightWithData:(NSString *)data
{
    int index = [CCADefaultViewCell getIndex:data];
    UITextView *textView = [[UITextView alloc] init];
    if (index != 0)
    {
        [textView setText:[data substringFromIndex:1]];
    }
    else
    {
        [textView setText:data];
    }
    if (index == 1)
    {
        [textView setFont:[UIFont fontWithName:@"Helvetica-bold" size:19]];
    }
    else
    {
        [textView setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    }
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    
    if (index == 2)
    {
        return [textView sizeThatFits:CGSizeMake(screenWidth - 50, FLT_MAX)].height;
    }
    return [textView sizeThatFits:CGSizeMake(screenWidth - 25, FLT_MAX)].height;
}

+ (int)getIndex:(NSString *)data
{
    int index = 0;
    if([[data substringToIndex:1] isEqualToString:@"1"])
    {
        index = 1;
    }
    else if ([[data substringToIndex:1] isEqualToString:@"2"])
    {
        index = 2;
    }
    return index;
}

@end
