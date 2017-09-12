//
//  DKADSetNativeAdapter.h
//  DKADSet
//
//  Created by alldk on 16/4/23.
//  Copyright © 2016年 alldk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BaiduMobAdSDK/BaiduMobAdNativeAdView.h"
#import "BaiduMobAdSDK/BaiduMobAdNativeAdDelegate.h"
#import "BaiduMobAdSDK/BaiduMobAdNative.h"
#import "BaiduMobAdSDK/BaiduMobAdNativeAdObject.h"
#import "BaiduMobAdSDK/BaiduMobAdNativeVideoView.h"
#import "BaiduMobAdSDK/BaiduMobAdNativeWebView.h"

@protocol DKADSetNativeAdapterDelegate <NSObject>

@optional

- (void)DKADSetNativeAdapterRequestAdFail:(id)error;


- (void)DKADSetNativeAdapterRequestSuccessWithViewList:(NSArray *)nativeViewList;


- (void)DKADSetNativeAdapterClicked;


@end


@class DKADSetNativeDataModel;


@interface DKADSetNativeAdapter : NSObject<BaiduMobAdNativeAdDelegate>

@property(nonatomic,retain)BaiduMobAdNative *native;


@property (nonatomic, weak)id<DKADSetNativeAdapterDelegate> nativeAdapterDelegate;

@property (nonatomic, weak)UIViewController *currentVC;


@property (nonatomic, assign)CGRect nativeFrame;


- (void)configure;

/**
 *  加载广告
 */
- (void)load;



//展示广告
-(void)DKADSetNativeAdapterShowAdWithView:(UIView *)view;

//点击广告
-(void)DKADSetNativeAdapterClickAdWithModel:(DKADSetNativeDataModel *)dataModel;
@end
