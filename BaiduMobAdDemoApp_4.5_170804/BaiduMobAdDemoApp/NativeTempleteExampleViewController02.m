//
//  NativeTempleteExampleViewController01.m
//  DKADSet
//
//  Created by admin on 2017/9/11.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import "NativeTempleteExampleViewController02.h"


#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface NativeTempleteExampleViewController02 ()

@end

@implementation NativeTempleteExampleViewController02

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, WIDTH, HEIGHT-100) style:UITableViewStylePlain] ;
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self.view addSubview:self.mainTableView];
    
    self.adViewArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    [self.mainTableView registerClass:[UITableViewCell class]
               forCellReuseIdentifier:@"UITableViewCell"];
    self.tableView = self.mainTableView;
    [self pressToLoadAd:nil];

}


#pragma mark - 广告相关设置
//请求广告
- (IBAction)pressToLoadAd:(UIButton *)sender
{
//#warning ATS默认开启状态, 可根据需要关闭App Transport Security Settings，设置关闭BaiduMobAdSetting的supportHttps，以请求http广告，多个产品只需要设置一次.    [BaiduMobAdSetting sharedInstance].supportHttps = NO;
    
    if (!self.native)
    {
        self.native = [[DKADSetNativeAdapter alloc]init];
        self.native.nativeAdapterDelegate = self;
    }
    //请求原生广告
 
    self.native.currentVC = self;

    self.native.nativeFrame = CGRectMake(0, 0, WIDTH, WIDTH / 1.5);
    
    [self.native configure];
    [self.native load];

    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.native.nativeAdapterDelegate = nil;
    self.native = nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.adViewArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return WIDTH / 1.5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    if (self.adViewArray.count > indexPath.row)
    {
        BaiduMobAdNativeAdView *view = [self.adViewArray objectAtIndex:indexPath.row];
        view.tag = 0;
        [[cell viewWithTag:0] removeFromSuperview];
        [cell addSubview: view];
        
    }
    return cell;
}

- (void)dealloc {
    _native = nil;
    for (UIView *adview in _adViewArray) {
        [adview removeFromSuperview];
    }
    [_adViewArray removeAllObjects];
    _adViewArray = nil;
}


#pragma mark - native adapter Delegate



- (void)DKADSetNativeAdapterRequestAdFail:(id)error{
    
    NSLog(@"%s error:%@", __func__, error);
    
}



- (void)DKADSetNativeAdapterRequestSuccessWithViewList:(NSArray *)nativeViewList{
    
    NSLog(@"%s %lu", __func__, (unsigned long)nativeViewList.count);
    
    [self.adViewArray removeAllObjects];
    [self.adViewArray addObjectsFromArray:nativeViewList];
    
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [self.tableView reloadData];
        
    });
    
}



- (void)DKADSetNativeAdapterClicked{
    
    NSLog(@"%s", __func__);
    
}


@end
