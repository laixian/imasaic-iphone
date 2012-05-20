//
//  RootViewController.h
//  imasaic
//
//  Created by 张来贤 zhang on 12-5-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBEngine.h"
#import "AppDelegate.h"


@interface RootViewController : UIViewController<WBEngineDelegate> {

}
@property(nonatomic, retain)IBOutlet UIButton *loginButton; 
@property(retain, nonatomic)WBEngine *sinaWBEngine;

- (IBAction)doSinaLogin:(id)sender;
@end
