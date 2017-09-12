//
//  NativeTempleteExampleViewController01.h
//  DKADSet
//
//  Created by admin on 2017/9/11.
//  Copyright © 2017年 alldk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DKADSetNativeAdapter.h"

@interface NativeTempleteExampleViewController02 : UITableViewController<DKADSetNativeAdapterDelegate, UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)DKADSetNativeAdapter *native;

@property(nonatomic,retain)UITableView*mainTableView;

@property (nonatomic, retain) NSMutableArray *adViewArray;

@end
