//
//  DKADSetNativeAdapter.m
//  DKADSet
//
//  Created by alldk on 16/4/23.
//  Copyright © 2016年 alldk. All rights reserved.
//

#import "DKADSetNativeAdapter.h"
#import "BaiduMobAdSDK/BaiduMobAdSetting.h"


@implementation DKADSetNativeAdapter

- (void)configure{}

- (void)load{
    
    if (!self.native) {
        self.native = [[BaiduMobAdNative alloc]init];
        self.native.delegate = self;
    }
    [BaiduMobAdSetting sharedInstance].supportHttps = NO;
    
    //请求原生广告
    [self.native requestNativeAds];
    
}



- (void)DKADSetNativeAdapterShowAdWithView:(UIView *)view{}

//点击广告
-(void)DKADSetNativeAdapterClickAdWithModel:(DKADSetNativeDataModel *)dataModel{}


#pragma mark - baidu mobAd native Delegate

/**
 *  应用的APPID
 */
-(NSString*)publisherId
{
    return @"fccbc018";
}

/**
 * 广告位id
 */
-(NSString*)apId
{
    return @"4730491";
    
}


/**
 * 广告请求成功
 请求成功的BaiduMobAdNativeAdObject数组，如果只成功返回一条原生广告，数组大小为1
 */
- (void)nativeAdObjectsSuccessLoad:(NSArray*)nativeAds{
    NSMutableArray *viewListArray =[[NSMutableArray alloc] init];
    
    for (BaiduMobAdNativeAdObject *object in nativeAds) {
        
        //创建每一条的广告view
        BaiduMobAdNativeAdView *view;
        BaiduMobAdNativeWebView *webview = [[BaiduMobAdNativeWebView alloc]initWithFrame:self.nativeFrame andObject:object];
        view = [[BaiduMobAdNativeAdView alloc]initWithFrame:self.nativeFrame
                                                    webview:webview];
        //取到每一条广告object
        //展现前检查是否过期,30分钟广告过期,请放弃展示并重新请求
        if ([object isExpired]) {
            continue;
        }
        //如果开启了多图模式，则可以在标准的BaiduMobAdNativeAdView上添加自定义多图
        if([object.morepics count]>0 ){
            NSLog(@"多图url array 为 %@",object.morepics);
            UIImageView *imageview = [[UIImageView alloc]init] ;
            [view addSubview:imageview];
        }
        
        //根据广告object加载和显示广告内容
        [view loadAndDisplayNativeAdWithObject:object
                                    completion:^(NSArray *errors) {
                                        NSLog(@"%@", errors);
                                        //                                        if (!errors) {
                                        //                                            [self.mainArray addObject:view];
                                        //                                            // 确定视图显示在window上之后再调用trackImpression，不要太早调用
                                        //                                            //在tableview或scrollview中使用时尤其要注意
                                        //                                            //本demo中在tableViewCell展现时调用了trackImpression
                                        //                                            [self.mainTableView reloadData];
                                        //                                        }
                                    }];
        
        if (view) {
            [viewListArray addObject:view];
        }
        
        
    }
    
    #pragma mark - ================== 在这里回调给 NativeTempleteExampleViewController02 类使用 ==================
    if (viewListArray.count != 0) {
        [self.nativeAdapterDelegate DKADSetNativeAdapterRequestSuccessWithViewList:viewListArray];
    }
   
}


@end
