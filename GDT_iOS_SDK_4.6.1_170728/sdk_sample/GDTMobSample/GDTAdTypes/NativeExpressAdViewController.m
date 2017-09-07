//
//  NativeExpressAdViewController.m
//  GDTMobApp
//
//  Created by michaelxing on 2017/4/17.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import "NativeExpressAdViewController.h"
#import "GDTNativeExpressAd.h"
#import "GDTNativeExpressAdView.h"

@interface NativeExpressAdViewController ()<GDTNativeExpressAdDelegete>

// 用于请求原生模板广告，注意：不要在广告打开期间释放！
@property (nonatomic, retain)   GDTNativeExpressAd *nativeExpressAd;

// 存储返回的GDTNativeExpressAdView
@property (nonatomic, retain)       NSArray *expressAdViews;

// 当前展示模板广告的View（开发者可以自己设置）
@property (weak, nonatomic) IBOutlet UIView *expressAdView;



@property (weak, nonatomic) IBOutlet UILabel *positionWLabel;
@property (weak, nonatomic) IBOutlet UISlider *positionW;

@property (weak, nonatomic) IBOutlet UILabel *positionHLabel;
@property (weak, nonatomic) IBOutlet UISlider *positionH;
@property (weak, nonatomic) IBOutlet UITextField *positionIDTextField;

@end

@implementation NativeExpressAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    //默认值
    self.positionW.value = 300;
    self.positionH.value = 200;
    
    self.positionWLabel.text = [NSString stringWithFormat:@"宽：300"];
    self.positionHLabel.text = [NSString stringWithFormat:@"高：200"];
    
    [self.positionW addTarget:self action:@selector(sliderPositionWChanged) forControlEvents:UIControlEventValueChanged];
    [self.positionH addTarget:self action:@selector(sliderPositionHChanged) forControlEvents:UIControlEventValueChanged];
}

- (IBAction)refreshButton:(id)sender {
    
//    CGFloat adViewW = kScreenWidth;
//    CGFloat adViewH = kScreenWidth * scale;
    // lzy170907注：以下几个是百度模板信息流的比例（有填充的）
    // lzy170907注：3:2  y
    //        return @"4730491";
    
    // lzy170907注：4:1  y
    //            return @"4730493";

    
    // lzy170907注：6:5  y
    //            return @"4730496";
    
    // lzy170907注：7:5  y
    //            return @"4730498";
    
    // lzy170907注：10:7  y
    //            return @"4730499";
    
    /* lzy170907注:
     
     后台配置3:2
     实际加载的是3:1素材是
     
     1 搞清楚到底是高：宽
     还是 宽：高
     搞定，广点通后台的配置是 宽比高。
     
     2 广点通可用比例 宽比高
     2:3 = 0.67
     16:9 = 1.78
     3:2 = 1.5
     
     3、百度可用比例 宽比高
     3:2 = 1.5
     4:1 = 4
     6:5 = 1.2
     7:5 = 1.4
     10:7 = 1.429
     
     4 可能可以通用的比例
     
     gdt:
     16:9 = 1.78
     3:2 = 1.5
     
     baidu:
     6:5 = 1.2
     7:5 = 1.4
     10:7 = 1.429
     3:2 = 1.5
     */

    
    /* lzy170907注:原始方法
     self.nativeExpressAd = [[GDTNativeExpressAd alloc] initWithAppkey:@"1105344611" placementId:self.positionIDTextField.text adSize:CGSizeMake(300, 200)];
     self.nativeExpressAd.delegate = self;
     
     */
    /* lzy170907注:y
     lzyTest-爽爽-纯图-8*12，宽比高
     self.nativeExpressAd = [[GDTNativeExpressAd alloc] initWithAppkey:@"1105272441" placementId:@"5090824556769679" adSize:CGSizeMake(300, 200)];
     self.nativeExpressAd.delegate = self;

     */
    /* lzy170907注:y
     lzyTest-爽爽-纯图-128*72 16:9 宽比高
     self.nativeExpressAd = [[GDTNativeExpressAd alloc] initWithAppkey:@"1105272441" placementId:@"2020823506661698" adSize:CGSizeMake(300, 200)];
     self.nativeExpressAd.delegate = self;
     */
    /* lzy170907注:y
     lzyTest-爽爽-双图双文-128*72 16:9
     self.nativeExpressAd = [[GDTNativeExpressAd alloc] initWithAppkey:@"1105272441" placementId:@"9000127516669627" adSize:CGSizeMake(300, 200)];
     self.nativeExpressAd.delegate = self;
     */
    /* lzy170907注:y
     lzyTest-爽爽-左文右图-12*8 3:2 宽比高
     self.nativeExpressAd = [[GDTNativeExpressAd alloc] initWithAppkey:@"1105272441" placementId:@"7070228576166686" adSize:CGSizeMake(300, 200)];
     self.nativeExpressAd.delegate = self;
     */
    /* lzy170907注:y
     lzyTest-爽爽-左图右文-12*8 3:2
     self.nativeExpressAd = [[GDTNativeExpressAd alloc] initWithAppkey:@"1105272441" placementId:@"8080828566567615" adSize:CGSizeMake(300, 200)];
     self.nativeExpressAd.delegate = self;
     
     */
    
    /* lzy170907注:y
     lzyTest-爽爽-上文下图-128*72 16:9
     self.nativeExpressAd = [[GDTNativeExpressAd alloc] initWithAppkey:@"1105272441" placementId:@"9040427516660654" adSize:CGSizeMake(300, 200)];
     self.nativeExpressAd.delegate = self;
     
     */
    /* lzy170907注:n
     lzyTest-爽爽-上图下文-128*72
     self.nativeExpressAd = [[GDTNativeExpressAd alloc] initWithAppkey:@"1105272441" placementId:@"4010620556265693" adSize:CGSizeMake(300, 200)];
     self.nativeExpressAd.delegate = self;
     */
    self.nativeExpressAd = [[GDTNativeExpressAd alloc] initWithAppkey:@"1105272441" placementId:@"2020823506661698" adSize:CGSizeMake(200, 300)];
    // lzy170907注：创建的时候的size对于原始模板广告无效，尺寸在回调中设定
    self.nativeExpressAd.delegate = self;


    // 拉取5条广告
    [self.nativeExpressAd loadAd:5];
}

- (void)sliderPositionWChanged {

    self.positionWLabel.text = [NSString stringWithFormat:@"宽：%.0f",self.positionW.value];
}

- (void)sliderPositionHChanged {
    
    self.positionHLabel.text = [NSString stringWithFormat:@"高：%.0f",self.positionH.value];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

/**
 * 拉取广告成功的回调
 */
- (void)nativeExpressAdSuccessToLoad:(GDTNativeExpressAd *)nativeExpressAd views:(NSArray<__kindof GDTNativeExpressAdView *> *)views
{
    NSLog(@"%s 原始模板广告%ld个", __func__, views.count);
    [self.expressAdViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GDTNativeExpressAdView *adView = (GDTNativeExpressAdView *)obj;
        [adView removeFromSuperview];
    }];
    
    self.expressAdViews = [NSArray arrayWithArray:views];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
    UIViewController *rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    //vc = [self navigationController];
#pragma clang diagnostic pop
    
    if (self.expressAdViews.count) {
        
        // 取一个GDTNativeExpressAdView
        GDTNativeExpressAdView *expressView =  [self.expressAdViews objectAtIndex:0];
        // 设置frame，开发者自己设置
//        expressView.frame = CGRectMake(0, 0, 80, 120);
//        expressView.frame = CGRectMake(0, 0, 160, 90);
//        expressView.frame = CGRectMake(0, 0, 320, 213.33);
        
        expressView.controller = rootViewController;
        
        [expressView render];
        
        //添加View的时机，开发者控制
        [self.expressAdView addSubview:expressView];
       
    }
   
}

/**
 * 拉取广告失败的回调
 */
- (void)nativeExpressAdFailToLoad:(GDTNativeExpressAd *)nativeExpressAd error:(NSError *)error {
    NSLog(@"%s %@",__FUNCTION__, error);

}
/**
 * 拉取广告失败的回调
 */
- (void)nativeExpressAdRenderFail:(GDTNativeExpressAdView *)nativeExpressAdView
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)nativeExpressAdViewRenderSuccess:(GDTNativeExpressAdView *)nativeExpressAdView
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)nativeExpressAdViewClicked:(GDTNativeExpressAdView *)nativeExpressAdView
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
