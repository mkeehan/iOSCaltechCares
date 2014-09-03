//
//  CCAAppDelegate.m
//  CaltechCares
//
//  Created by Megan Keehan on 7/13/14.
//  Copyright (c) 2014 Megan Keehan. All rights reserved.
//

#import "CCAAppDelegate.h"
#import "IIViewDeckController.h"
#import "CCAMenuViewController.h"
#import "CCAInfoTextViewController.h"
#import "CCAMapViewController.h"

@interface CCAAppDelegate () <IIViewDeckControllerDelegate>

@property (nonatomic, strong) IIViewDeckController *viewDeckController;
@property (nonatomic, strong) CCAMenuViewController *menuViewController;
@property (nonatomic, strong) UINavigationController *infoNavController;
@property (nonatomic, strong) UINavigationController *maybeNavController;

@end

@implementation CCAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    CCAInfoTextViewController *infoVC = [[CCAInfoTextViewController alloc] init];
    self.infoNavController = [[UINavigationController alloc] initWithRootViewController:infoVC];
    
    self.menuViewController = [[CCAMenuViewController alloc] init];
    
    self.viewDeckController =  [[IIViewDeckController alloc] initWithCenterViewController:self.infoNavController leftViewController:self.menuViewController rightViewController:nil];
    self.viewDeckController.delegate = self;
    self.viewDeckController.delegateMode = IIViewDeckDelegateAndSubControllers;
    self.viewDeckController.elastic = NO;
    self.viewDeckController.leftSize = PEEK_WIDTH;
    self.viewDeckController.openSlideAnimationDuration = 0.15f;
    self.viewDeckController.closeSlideAnimationDuration = 0.15f;
    self.viewDeckController.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose;
    self.window.rootViewController = self.viewDeckController;
    self.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)viewDeckController:(IIViewDeckController *)viewDeckController applyShadow:(CALayer *)shadowLayer withBounds:(CGRect)rect {
    shadowLayer.masksToBounds = NO;
    shadowLayer.shadowRadius = 5;
    shadowLayer.shadowOpacity = 0.9;
    shadowLayer.shadowColor = [[UIColor redColor] CGColor];
    shadowLayer.shadowOffset = CGSizeZero;
    shadowLayer.shadowPath = [[UIBezierPath bezierPathWithRect:rect] CGPath];
}

- (void)openMenu
{
    [self.viewDeckController openLeftViewAnimated:YES];
}

- (void)updateCenterView:(NSMutableArray *)array
{
    [self.viewDeckController setCenterController:self.infoNavController];
    [((CCAInfoTextViewController *)self.infoNavController.viewControllers[0]) setRowData:array];
    [self.viewDeckController closeLeftViewAnimated:YES];
}

- (void)openMap
{
    CCAMapViewController *vc = [[CCAMapViewController alloc] init];
    self.window.rootViewController = vc;
}

- (void)closeMap
{
    self.window.rootViewController = self.viewDeckController;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    self.menuViewController = [[CCAMenuViewController alloc] init];
    [self.viewDeckController setLeftController:self.menuViewController]; // to update if during hours or after hours
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
