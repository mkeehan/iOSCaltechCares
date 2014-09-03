//
//  CCADefaultViewCell.h
//  CaltechCares
//
//  Created by Megan Keehan on 8/3/14.
//  Copyright (c) 2014 Megan Keehan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Styles.h"

@interface CCADefaultViewCell : UITableViewCell

- (void)setData:(NSString *)data;

+ (CGFloat)getRowHeightWithData:(NSString *)data;
+ (int)getIndex:(NSString *)data;

@end
