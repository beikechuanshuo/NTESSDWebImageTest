//
//  NTESSDWebImagePrefetcher.m
//  NTESSDWebImageTest
//
//  Created by 李彦军 on 2018/8/8.
//  Copyright © 2018年 NetEase, Inc. All rights reserved.
//

#import "NTESSDWebImagePrefetcher.h"

@interface NTESSDWebImagePrefetcher()<SDWebImagePrefetcherDelegate>

@property (nonatomic, strong) SDWebImagePrefetcher *imagePerfetcher;

@end

@implementation NTESSDWebImagePrefetcher

+ (NTESSDWebImagePrefetcher *)sharedImagePrefetcher{
    
    static NTESSDWebImagePrefetcher *prefetcher = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        prefetcher = [[NTESSDWebImagePrefetcher alloc] init];
    });
    return prefetcher;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.imagePerfetcher = [[SDWebImagePrefetcher sharedImagePrefetcher] init];
        self.imagePerfetcher.delegate = self;
    }
    return self;
}

- (id)initWithImageManager:(NTESSDWebImageManager *)manager{
    self = [super init];
    if (self) {
        self.imagePerfetcher = [[SDWebImagePrefetcher sharedImagePrefetcher] initWithImageManager:[manager getSDWebImageManager]];
        self.imagePerfetcher.delegate = self;
    }
    return self;
}

- (void)prefetchURLs:(NSArray *)urls{
    [self.imagePerfetcher prefetchURLs:urls];
}

- (void)prefetchURLs:(NSArray *)urls progress:(NTESSDWebImagePrefetcherProgressBlock)progressBlock completed:(NTESSDWebImagePrefetcherCompletionBlock)completionBlock{
    [self.imagePerfetcher prefetchURLs:urls progress:^(NSUInteger noOfFinishedUrls, NSUInteger noOfTotalUrls) {
        if (progressBlock) {
            progressBlock(noOfFinishedUrls,noOfTotalUrls);
        }
    } completed:^(NSUInteger noOfFinishedUrls, NSUInteger noOfSkippedUrls) {
        if (completionBlock) {
            completionBlock(noOfFinishedUrls,noOfSkippedUrls);
        }
    }];
}

- (void)cancelPrefetching{
    [self.imagePerfetcher cancelPrefetching];
}

#pragma mark - SDWebImagePrefetcherDelegate
- (void)imagePrefetcher:(SDWebImagePrefetcher *)imagePrefetcher didPrefetchURL:(NSURL *)imageURL finishedCount:(NSUInteger)finishedCount totalCount:(NSUInteger)totalCount{
    if (self.delegate && [self.delegate respondsToSelector:@selector(imagePrefetcher:didPrefetchURL:finishedCount:totalCount:)]) {
        [self.delegate imagePrefetcher:self didPrefetchURL:imageURL finishedCount:finishedCount totalCount:totalCount];
    }
}

- (void)imagePrefetcher:(SDWebImagePrefetcher *)imagePrefetcher didFinishWithTotalCount:(NSUInteger)totalCount skippedCount:(NSUInteger)skippedCount{
    if (self.delegate && [self.delegate respondsToSelector:@selector(imagePrefetcher:didFinishWithTotalCount:skippedCount:)]) {
        [self.delegate imagePrefetcher:self didFinishWithTotalCount:totalCount skippedCount:skippedCount];
    }
}

#pragma mark - Setter And Getter
- (void)setMaxConcurrentDownloads:(NSUInteger)maxConcurrentDownloads{
    self.imagePerfetcher.maxConcurrentDownloads = maxConcurrentDownloads;
}

- (NSUInteger)maxConcurrentDownloads{
    return self.imagePerfetcher.maxConcurrentDownloads;
}

- (void)setOptions:(NTESSDWebImageOptions)options{
    self.imagePerfetcher.options = (SDWebImageOptions)options;
}

- (NTESSDWebImageOptions)options{
    return (NTESSDWebImageOptions)self.imagePerfetcher.options;
}

- (void)setPrefetcherQueue:(dispatch_queue_t)prefetcherQueue{
    self.imagePerfetcher.prefetcherQueue = prefetcherQueue;
}

- (dispatch_queue_t)prefetcherQueue{
    return self.imagePerfetcher.prefetcherQueue;
}

@end
