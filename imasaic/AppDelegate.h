//
//  AppDelegate.h
//  imasaic
//
//  Created by 张来贤 zhang on 12-5-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@class RootViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>{
    UITabBarController *mainViewController;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RootViewController   *rootViewController;
@property (nonatomic, retain) IBOutlet UITabBarController *mainViewController;

- (void)showMainView;
@end
