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
- (void)DKADSetNativeAdapterRequestSuccessWithViewList:(NSArray *)nativeViewList;
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

@end
