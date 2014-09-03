//
//  CCAMapViewController.m
//  CaltechCares
//
//  Created by Megan Keehan on 8/25/14.
//  Copyright (c) 2014 Megan Keehan. All rights reserved.
//

#import "CCAMapViewController.h"
#import "CCAAppDelegate.h"

@interface CCAMapViewController () <UIDocumentInteractionControllerDelegate>

@property (nonatomic, strong) UIDocumentInteractionController *docInteractionController;

@end

@implementation CCAMapViewController

- (id) init
{
    self = [super init];
    if (self)
    {
        NSURL *url =  [[NSBundle mainBundle] URLForResource:@"Caltech_Map" withExtension:@"pdf"];
        self.docInteractionController = [UIDocumentInteractionController interactionControllerWithURL:url];
        self.docInteractionController.delegate = self;
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void) viewDidAppear:(BOOL)animated
{
    [self.docInteractionController presentPreviewAnimated:NO];
}

- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller {
    return self;
}

- (void) documentInteractionControllerDidEndPreview:(UIDocumentInteractionController *)controller
{
    CCAAppDelegate *app = [[UIApplication sharedApplication] delegate];
    [app closeMap];
    
}


@end
