//
//  UIImageView+NTESWebCache.m
//  NTESSDWebImageTest
//
//  Created by 李彦军 on 2018/8/8.
//  Copyright © 2018年 NetEase, Inc. All rights reserved.
//

#import "UIImageView+NTESWebCache.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (NTESWebCache)

- (NSURL *)ntes_sd_imageURL{
    return [self sd_imageURL];
}

- (void)ntes_sd_setImageWithURL:(NSURL *)url{
    [self sd_setImageWithURL:url];
}

- (void)ntes_sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder{
    [self sd_setImageWithURL:url placeholderImage:placeholder];
}

- (void)ntes_sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(NTESSDWebImageOptions)options{
    [self sd_setImageWithURL:url placeholderImage:placeholder options:(SDWebImageOptions)options];
}

- (void)ntes_sd_setImageWithURL:(NSURL *)url completed:(NTESSDWebImageCompletionBlock)completedBlock{
    [self sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image,error,(NTESSDImageCacheType)cacheType,imageURL);
        }
    }];
}

- (void)ntes_sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(NTESSDWebImageCompletionBlock)completedBlock{
    [self sd_setImageWithURL:url placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image,error,(NTESSDImageCacheType)cacheType,imageURL);
        }
    }];
}

- (void)ntes_sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(NTESSDWebImageOptions)options completed:(NTESSDWebImageCompletionBlock)completedBlock{
    [self sd_setImageWithURL:url placeholderImage:placeholder options:(SDWebImageOptions)options completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image,error,(NTESSDImageCacheType)cacheType,imageURL);
        }
    }];
}

- (void)ntes_sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(NTESSDWebImageOptions)options progress:(NTESSDWebImageDownloaderProgressBlock)progressBlock completed:(NTESSDWebImageCompletionBlock)completedBlock{
    [self sd_setImageWithURL:url placeholderImage:placeholder options:(SDWebImageOptions)options progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (progressBlock) {
            progressBlock(receivedSize,expectedSize);
        }
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image,error,(NTESSDImageCacheType)cacheType,imageURL);
        }
    }];
}

- (void)ntes_sd_setImageWithPreviousCachedImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(NTESSDWebImageOptions)options progress:(NTESSDWebImageDownloaderProgressBlock)progressBlock completed:(NTESSDWebImageCompletionBlock)completedBlock{
    [self sd_setImageWithPreviousCachedImageWithURL:url placeholderImage:placeholder options:(SDWebImageOptions)options progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (progressBlock) {
            progressBlock(receivedSize,expectedSize);
        }
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image,error,(NTESSDImageCacheType)cacheType,imageURL);
        }
    }];
}

- (void)ntes_sd_setAnimationImagesWithURLs:(NSArray *)arrayOfURLs{
    [self sd_setAnimationImagesWithURLs:arrayOfURLs];
}

- (void)ntes_sd_cancelCurrentImageLoad{
    [self sd_cancelCurrentImageLoad];
}

- (void)ntes_sd_cancelCurrentAnimationImagesLoad{
    [self sd_cancelCurrentAnimationImagesLoad];
}

- (void)ntes_setShowActivityIndicatorView:(BOOL)show{
    [self setShowActivityIndicatorView:show];
}

- (void)ntes_setIndicatorStyle:(UIActivityIndicatorViewStyle)style{
    [self setIndicatorStyle:style];
}

@end
