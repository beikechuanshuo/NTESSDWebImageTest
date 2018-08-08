//
//  UIView+NTESWebCacheOperation.h
//  NTESSDWebImageTest
//  对SDWebImage库中UIView+WebCacheOperation进行中间层封装，减少升级第三方库而引起的大量改动
//
//  Created by 李彦军 on 2018/8/8.
//  Copyright © 2018年 NetEase, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (NTESWebCacheOperation)

- (void)ntes_sd_setImageLoadOperation:(id)operation forKey:(NSString *)key;

- (void)ntes_sd_cancelImageLoadOperationWithKey:(NSString *)key;

- (void)ntes_sd_removeImageLoadOperationWithKey:(NSString *)key;

@end
