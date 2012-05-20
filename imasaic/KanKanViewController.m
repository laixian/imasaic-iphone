//
//  MainViewController.m
//  imasaic
//
//  Created by 张来贤 zhang on 12-5-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "KanKanViewController.h"
#import "MosaicTbCell.h"

#define API_DOMAIN @"http://imasaic.com"

@implementation KanKanViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * tableIdentifier=@"MosaicTBCellIdentifier";
    static BOOL nibsRegistered=NO;
    if(!nibsRegistered)
    {//第一次运行时注册nib文件，文件名不需要扩展名
        UINib *nib=[UINib nibWithNibName:@"MosaicTBCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:tableIdentifier];
        nibsRegistered=YES;
    }
    MosaicTbCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    NSDictionary *rowData = [[photoListData objectForKey:@"photo_list"] objectAtIndex:indexPath.row];
    //NSUInteger rowNumber=[indexPath row];
    cell.strTime = [rowData objectForKey:@"date"];
    NSLog(@"IMAGEURL:%@", cell.strTime);
    cell.timeLabel.text = cell.strTime;
    cell.strNickName = [rowData objectForKey:@"uname"];
    cell.nickNameLabel.text = cell.strNickName;
    UIImage *image = [UIImage imageNamed:@"face_tiny.jpg"];
    cell.faceImage = image;
    [cell.faceImageView setImage:cell.faceImage];
    [cell setFaceRadius];
    //cell.mosaicImage 
    NSURL *mosaicSmallUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", API_DOMAIN, [rowData objectForKey:@"small"]]];
    [cell.mosaicImageView setImageWithURL:mosaicSmallUrl placeholderImage:[UIImage imageNamed:@"loadingbig.png"]];
    //cell.mosaicImageView.autoresizingMask = UIViewC;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //返回行数
    NSArray *photoList = [photoListData objectForKey:@"photo_list"];
    NSInteger count = photoList.count;
    if(photoList == nil)
        count = 0;
        NSLog(@"%d", count);
    return count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //返回行高
    NSArray *photoList = [photoListData objectForKey:@"photo_list"];
    NSDictionary *rowData = [photoList objectAtIndex:indexPath.row];
    NSString *strHeight = [rowData objectForKey:@"height"];
    NSInteger heightInt = [strHeight integerValue];
    NSLog(@"Height:%d", heightInt);
    heightInt = heightInt / 4 + 40;
    if(heightInt == 280)
        heightInt += 20;
    return heightInt;
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc] initWithTitle:@"拍照" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.title = @"Ta们的马赛克";
    [self.navigationItem setRightBarButtonItem:cameraButton animated:TRUE];
    [cameraButton release];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"%@/api/list/", API_DOMAIN]];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        NSString *response = [request responseString];
        photoListData = [[NSDictionary alloc] initWithDictionary: [response objectFromJSONStringWithParseOptions:JKSerializeOptionEscapeUnicode]];
    }
    
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc{
    [super dealloc];
}

@end
