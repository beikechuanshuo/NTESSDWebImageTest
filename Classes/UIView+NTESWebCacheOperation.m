//
//  UIView+NTESWebCacheOperation.m
//  NTESSDWebImageTest
//
//  Created by 李彦军 on 2018/8/8.
//  Copyright © 2018年 NetEase, Inc. All rights reserved.
//

#import "UIView+NTESWebCacheOperation.h"
#import "UIView+WebCacheOperation.h"

@implementation UIView (NTESWebCacheOperation)

- (void)ntes_sd_setImageLoadOperation:(id)operation forKey:(NSString *)key{
    [self sd_setImageLoadOperation:operation forKey:key];
}

- (void)ntes_sd_cancelImageLoadOperationWithKey:(NSString *)key{
    [self sd_cancelImageLoadOperationWithKey:key];
}

- (void)ntes_sd_removeImageLoadOperationWithKey:(NSString *)key{
    [self sd_removeImageLoadOperationWithKey:key];
}

@end
