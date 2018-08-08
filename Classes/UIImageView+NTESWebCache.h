//
//  UIImageView+NTESWebCache.h
//  NTESSDWebImageTest
//  对SDWebImage库中UIImageView+WebCache进行中间层封装，减少升级第三方库而引起的大量改动
//
//  Created by 李彦军 on 2018/8/8.
//  Copyright © 2018年 NetEase, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTESSDWebImageManager.h"

@interface UIImageView (NTESWebCache)

- (NSURL *)ntes_sd_imageURL;

- (void)ntes_sd_setImageWithURL:(NSURL *)url;

- (void)ntes_sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

- (void)ntes_sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(NTESSDWebImageOptions)options;

- (void)ntes_sd_setImageWithURL:(NSURL *)url completed:(NTESSDWebImageCompletionBlock)completedBlock;

- (void)ntes_sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(NTESSDWebImageCompletionBlock)completedBlock;

- (void)ntes_sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(NTESSDWebImageOptions)options completed:(NTESSDWebImageCompletionBlock)completedBlock;

- (void)ntes_sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(NTESSDWebImageOptions)options progress:(NTESSDWebImageDownloaderProgressBlock)progressBlock completed:(NTESSDWebImageCompletionBlock)completedBlock;

- (void)ntes_sd_setImageWithPreviousCachedImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(NTESSDWebImageOptions)options progress:(NTESSDWebImageDownloaderProgressBlock)progressBlock completed:(NTESSDWebImageCompletionBlock)completedBlock;

- (void)ntes_sd_setAnimationImagesWithURLs:(NSArray *)arrayOfURLs;

- (void)ntes_sd_cancelCurrentImageLoad;

- (void)ntes_sd_cancelCurrentAnimationImagesLoad;

- (void)ntes_setShowActivityIndicatorView:(BOOL)show;

- (void)ntes_setIndicatorStyle:(UIActivityIndicatorViewStyle)style;

@end
