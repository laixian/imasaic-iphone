//
//  MainViewController.h
//  imasaic
//
//  Created by 张来贤 zhang on 12-5-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "JSONKit.h"
#import "ASIHTTPRequest.h"

@interface KanKanViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    NSDictionary *photoListData;
}

@end
