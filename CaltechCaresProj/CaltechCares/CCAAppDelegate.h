//
//  CCAAppDelegate.h
//  CaltechCares
//
//  Created by Megan Keehan on 7/13/14.
//  Copyright (c) 2014 Megan Keehan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)openMenu;
- (void)openMap;
- (void)updateCenterView:(NSMutableArray *)array;

- (void)closeMap;

@end
