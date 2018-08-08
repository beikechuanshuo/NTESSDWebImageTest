//
//  NTESSDWebImagePrefetcher.h
//  NTESSDWebImageTest
//  对SDWebImage库中SDWebImagePrefetcher进行中间层封装，减少升级第三方库而引起的大量改动
//
//  Created by 李彦军 on 2018/8/8.
//  Copyright © 2018年 NetEase, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NTESSDWebImageManager.h"
#import "SDWebImagePrefetcher.h"

@class NTESSDWebImagePrefetcher;

@protocol NTESSDWebImagePrefetcherDelegate <NSObject>

@optional

- (void)imagePrefetcher:(NTESSDWebImagePrefetcher *)imagePrefetcher didPrefetchURL:(NSURL *)imageURL finishedCount:(NSUInteger)finishedCount totalCount:(NSUInteger)totalCount;

- (void)imagePrefetcher:(NTESSDWebImagePrefetcher *)imagePrefetcher didFinishWithTotalCount:(NSUInteger)totalCount skippedCount:(NSUInteger)skippedCount;

@end

typedef void(^NTESSDWebImagePrefetcherProgressBlock)(NSUInteger noOfFinishedUrls, NSUInteger noOfTotalUrls);
typedef void(^NTESSDWebImagePrefetcherCompletionBlock)(NSUInteger noOfFinishedUrls, NSUInteger noOfSkippedUrls);

@interface NTESSDWebImagePrefetcher : NSObject

@property (nonatomic, assign) NSUInteger maxConcurrentDownloads;

@property (nonatomic, assign) NTESSDWebImageOptions options;

@property (nonatomic, assign) dispatch_queue_t prefetcherQueue;

@property (nonatomic, weak) id <NTESSDWebImagePrefetcherDelegate> delegate;

+ (NTESSDWebImagePrefetcher *)sharedImagePrefetcher;

- (id)initWithImageManager:(NTESSDWebImageManager *)manager;

- (void)prefetchURLs:(NSArray *)urls;

- (void)prefetchURLs:(NSArray *)urls progress:(NTESSDWebImagePrefetcherProgressBlock)progressBlock completed:(NTESSDWebImagePrefetcherCompletionBlock)completionBlock;

- (void)cancelPrefetching;

@end
