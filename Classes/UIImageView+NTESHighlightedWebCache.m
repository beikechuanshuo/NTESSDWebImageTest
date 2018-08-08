//
//  UIImageView+NTESHighlightedWebCache.m
//  NTESSDWebImageTest
//
//  Created by 李彦军 on 2018/8/8.
//  Copyright © 2018年 NetEase, Inc. All rights reserved.
//

#import "UIImageView+NTESHighlightedWebCache.h"
#import "UIImageView+HighlightedWebCache.h"

@implementation UIImageView (NTESHighlightedWebCache)

- (void)ntes_sd_setHighlightedImageWithURL:(NSURL *)url{
    [self sd_setHighlightedImageWithURL:url];
}

- (void)ntes_sd_setHighlightedImageWithURL:(NSURL *)url options:(NTESSDWebImageOptions)options{
    [self sd_setHighlightedImageWithURL:url options:(SDWebImageOptions)options];
}

- (void)ntes_sd_setHighlightedImageWithURL:(NSURL *)url completed:(NTESSDWebImageCompletionBlock)completedBlock{
    [self sd_setHighlightedImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image,error,(NTESSDImageCacheType)cacheType,imageURL);
        }
    }];
}

- (void)ntes_sd_setHighlightedImageWithURL:(NSURL *)url options:(NTESSDWebImageOptions)options completed:(NTESSDWebImageCompletionBlock)completedBlock{
    [self sd_setHighlightedImageWithURL:url options:(SDWebImageOptions)options completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image,error,(NTESSDImageCacheType)cacheType,imageURL);
        }
    }];
}

- (void)ntes_sd_setHighlightedImageWithURL:(NSURL *)url options:(NTESSDWebImageOptions)options progress:(NTESSDWebImageDownloaderProgressBlock)progressBlock completed:(NTESSDWebImageCompletionBlock)completedBlock{
    [self sd_setHighlightedImageWithURL:url options:(SDWebImageOptions)options progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (progressBlock) {
            progressBlock(receivedSize,expectedSize);
        }
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image,error,(NTESSDImageCacheType)cacheType,imageURL);
        }
    }];
}

- (void)ntes_sd_cancelCurrentHighlightedImageLoad{
    [self sd_cancelCurrentHighlightedImageLoad];
}

@end
