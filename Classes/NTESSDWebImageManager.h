//
//  NTESSDWebImageManager.h
//  NTESSDWebImageTest
//  对SDWebImage库中SDWebImageManager进行中间层封装，减少升级第三方库而引起的大量改动
//
//  Created by 李彦军 on 2018/8/8.
//  Copyright © 2018年 NetEase, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SDWebImageManager.h"
#import "NTESSDImageCache.h"
#import "NTESSDWebImageDownloader.h"

@class NTESSDWebImageManager;

typedef NS_OPTIONS(NSUInteger, NTESSDWebImageOptions) {
    NTESSDWebImageRetryFailed = SDWebImageRetryFailed,
    NTESSDWebImageLowPriority = SDWebImageLowPriority,
    NTESSDWebImageCacheMemoryOnly = SDWebImageCacheMemoryOnly,
    NTESSDWebImageProgressiveDownload = SDWebImageProgressiveDownload,
    NTESSDWebImageRefreshCached = SDWebImageRefreshCached,
    NTESSDWebImageContinueInBackground = SDWebImageContinueInBackground,
    NTESSDWebImageHandleCookies = SDWebImageHandleCookies,
    NTESSDWebImageAllowInvalidSSLCertificates = SDWebImageAllowInvalidSSLCertificates,
    NTESSDWebImageHighPriority = SDWebImageHighPriority,
    NTESSDWebImageDelayPlaceholder = SDWebImageDelayPlaceholder,
    NTESSDWebImageTransformAnimatedImage = SDWebImageTransformAnimatedImage,
    NTESSDWebImageAvoidAutoSetImage = SDWebImageAvoidAutoSetImage,
};

typedef void(^NTESSDWebImageCompletionBlock)(UIImage *image, NSError *error, NTESSDImageCacheType cacheType, NSURL *imageURL);

typedef void(^NTESSDWebImageCompletionWithFinishedBlock)(UIImage *image, NSError *error, NTESSDImageCacheType cacheType, BOOL finished, NSURL *imageURL);

typedef NSString *(^NTESSDWebImageCacheKeyFilterBlock)(NSURL *url);

#pragma mark - NTESSDWebImageManagerDelegate
@protocol NTESSDWebImageManagerDelegate <NSObject>

@optional

- (BOOL)imageManager:(NTESSDWebImageManager *)imageManager shouldDownloadImageForURL:(NSURL *)imageURL;

- (UIImage *)imageManager:(NTESSDWebImageManager *)imageManager transformDownloadedImage:(UIImage *)image withURL:(NSURL *)imageURL;

@end

#pragma mark - NTESSDWebImageManager
@interface NTESSDWebImageManager : NSObject

@property (nonatomic, weak) id <NTESSDWebImageManagerDelegate> delegate;

@property (nonatomic, copy) NTESSDWebImageCacheKeyFilterBlock cacheKeyFilter;

+ (NTESSDWebImageManager *)sharedManager;

- (instancetype)initWithCache:(NTESSDImageCache *)cache downloader:(NTESSDWebImageDownloader *)downloader;

- (SDWebImageManager *)getSDWebImageManager;

- (id <SDWebImageOperation>)downloadImageWithURL:(NSURL *)url
                                         options:(NTESSDWebImageOptions)options
                                        progress:(NTESSDWebImageDownloaderProgressBlock)progressBlock
                                       completed:(NTESSDWebImageCompletionWithFinishedBlock)completedBlock;

- (void)saveImageToCache:(UIImage *)image forURL:(NSURL *)url;

- (void)cancelAll;

- (BOOL)isRunning;

- (BOOL)cachedImageExistsForURL:(NSURL *)url;

- (BOOL)diskImageExistsForURL:(NSURL *)url;

- (void)cachedImageExistsForURL:(NSURL *)url
                     completion:(NTESSDWebImageCheckCacheCompletionBlock)completionBlock;

- (void)diskImageExistsForURL:(NSURL *)url
                   completion:(NTESSDWebImageCheckCacheCompletionBlock)completionBlock;

- (NSString *)cacheKeyForURL:(NSURL *)url;

@end
