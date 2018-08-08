//
//  NTESSDWebImageManager.m
//  NTESSDWebImageTest
//
//  Created by 李彦军 on 2018/8/8.
//  Copyright © 2018年 NetEase, Inc. All rights reserved.
//

#import "NTESSDWebImageManager.h"

@interface NTESSDWebImageManager()<SDWebImageManagerDelegate>

@property (nonatomic, strong) SDWebImageManager *imageManager;

@end

@implementation NTESSDWebImageManager
#pragma mark - Public Method
+ (NTESSDWebImageManager *)sharedManager{
    static NTESSDWebImageManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NTESSDWebImageManager alloc] init];
    });
    
    return manager;
}

- (instancetype)init{
    self = [super init];
    if (self)
    {
        self.imageManager = [[SDWebImageManager sharedManager] init];
        self.imageManager.delegate = self;
    }
    return self;
}

- (instancetype)initWithCache:(NTESSDImageCache *)cache downloader:(NTESSDWebImageDownloader *)downloader{
    
    if (self)
    {
        self.imageManager = [[SDWebImageManager sharedManager] initWithCache:[cache getSDImageCache] downloader:[downloader getSDImageDownloader]];
        self.imageManager.delegate = self;
    }
    
    return self;
}

- (SDWebImageManager *)getSDWebImageManager{
    return self.imageManager;
}

- (id <SDWebImageOperation>)downloadImageWithURL:(NSURL *)url
                                         options:(NTESSDWebImageOptions)options
                                        progress:(NTESSDWebImageDownloaderProgressBlock)progressBlock
                                       completed:(NTESSDWebImageCompletionWithFinishedBlock)completedBlock{
    return [self.imageManager downloadImageWithURL:url options:(SDWebImageOptions)options progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (progressBlock) {
            progressBlock(receivedSize,expectedSize);
        }
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image,error,(NTESSDImageCacheType)cacheType,finished,imageURL);
        }
    }];
}

- (void)saveImageToCache:(UIImage *)image forURL:(NSURL *)url{
    [self.imageManager saveImageToCache:image forURL:url];
}

- (void)cancelAll{
    [self.imageManager cancelAll];
}

- (BOOL)isRunning{
    return [self.imageManager isRunning];
}

- (BOOL)cachedImageExistsForURL:(NSURL *)url{
    return [self.imageManager cachedImageExistsForURL:url];
}

- (BOOL)diskImageExistsForURL:(NSURL *)url{
    return [self.imageManager diskImageExistsForURL:url];
}

- (void)cachedImageExistsForURL:(NSURL *)url
                     completion:(NTESSDWebImageCheckCacheCompletionBlock)completionBlock{
    return [self.imageManager cachedImageExistsForURL:url completion:^(BOOL isInCache) {
        if (completionBlock) {
            completionBlock(isInCache);
        }
    }];
}

- (void)diskImageExistsForURL:(NSURL *)url
                   completion:(NTESSDWebImageCheckCacheCompletionBlock)completionBlock{
    [self.imageManager diskImageExistsForURL:url completion:^(BOOL isInCache) {
        if (completionBlock) {
            completionBlock(isInCache);
        }
    }];
}

- (NSString *)cacheKeyForURL:(NSURL *)url{
    return [self.imageManager cacheKeyForURL:url];
}

#pragma mark - SDWebImageManagerDelegate
- (BOOL)imageManager:(SDWebImageManager *)imageManager shouldDownloadImageForURL:(NSURL *)imageURL{
    if (self.delegate && [self.delegate respondsToSelector:@selector(imageManager:shouldDownloadImageForURL:)]) {
       return [self.delegate imageManager:self shouldDownloadImageForURL:imageURL];
    }else{
        return NO;
    }
}

- (UIImage *)imageManager:(SDWebImageManager *)imageManager transformDownloadedImage:(UIImage *)image withURL:(NSURL *)imageURL{
    if (self.delegate && [self.delegate respondsToSelector:@selector(imageManager:transformDownloadedImage:withURL:)]) {
       return [self.delegate imageManager:self transformDownloadedImage:image withURL:imageURL];
    }else{
        return nil;
    }
}

#pragma mark - Setter and Getter
- (void)setCacheKeyFilter:(NTESSDWebImageCacheKeyFilterBlock)cacheKeyFilter{
    self.imageManager.cacheKeyFilter = (SDWebImageCacheKeyFilterBlock)cacheKeyFilter;
}

- (NTESSDWebImageCacheKeyFilterBlock)cacheKeyFilter{
    return (NTESSDWebImageCacheKeyFilterBlock)self.imageManager.cacheKeyFilter;
}

@end
