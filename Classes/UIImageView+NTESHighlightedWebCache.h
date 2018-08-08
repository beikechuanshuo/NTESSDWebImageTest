//
//  UIImageView+NTESHighlightedWebCache.h
//  NTESSDWebImageTest
//  对SDWebImage库中UIImageView+HighlightedWebCache进行中间层封装，减少升级第三方库而引起的大量改动
//
//  Created by 李彦军 on 2018/8/8.
//  Copyright © 2018年 NetEase, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTESSDWebImageManager.h"
#import "NTESSDWebImageDownloader.h"

@interface UIImageView (NTESHighlightedWebCache)

- (void)ntes_sd_setHighlightedImageWithURL:(NSURL *)url;

- (void)ntes_sd_setHighlightedImageWithURL:(NSURL *)url options:(NTESSDWebImageOptions)options;

- (void)ntes_sd_setHighlightedImageWithURL:(NSURL *)url completed:(NTESSDWebImageCompletionBlock)completedBlock;

- (void)ntes_sd_setHighlightedImageWithURL:(NSURL *)url options:(NTESSDWebImageOptions)options completed:(NTESSDWebImageCompletionBlock)completedBlock;

- (void)ntes_sd_setHighlightedImageWithURL:(NSURL *)url options:(NTESSDWebImageOptions)options progress:(NTESSDWebImageDownloaderProgressBlock)progressBlock completed:(NTESSDWebImageCompletionBlock)completedBlock;

- (void)ntes_sd_cancelCurrentHighlightedImageLoad;

@end
