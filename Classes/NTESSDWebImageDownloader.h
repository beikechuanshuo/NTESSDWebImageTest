//
//  NTESSDWebImageDownloader.h
//  NTESSDWebImageTest
//  对SDWebImage库中SDWebImageDownloader进行中间层封装，减少升级第三方库而引起的大量改动
//
//  Created by 李彦军 on 2018/8/7.
//  Copyright © 2018年 NetEase.com, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SDWebImageDownloader.h"

typedef NS_OPTIONS(NSUInteger, NTESSDWebImageDownloaderOptions) {
    NTESSDWebImageDownloaderLowPriority = SDWebImageDownloaderLowPriority,
    NTESSDWebImageDownloaderProgressiveDownload = SDWebImageDownloaderProgressiveDownload,
    NTESSDWebImageDownloaderUseNSURLCache = SDWebImageDownloaderUseNSURLCache,
    NTESSDWebImageDownloaderIgnoreCachedResponse = SDWebImageDownloaderIgnoreCachedResponse,
    NTESSDWebImageDownloaderContinueInBackground = SDWebImageDownloaderContinueInBackground,
    NTESSDWebImageDownloaderHandleCookies = SDWebImageDownloaderHandleCookies,
    NTESSDWebImageDownloaderAllowInvalidSSLCertificates = SDWebImageDownloaderAllowInvalidSSLCertificates,
    NTESSDWebImageDownloaderHighPriority = SDWebImageDownloaderHighPriority,
};

typedef NS_ENUM(NSInteger, NTESSDWebImageDownloaderExecutionOrder) {
    NTESSDWebImageDownloaderFIFOExecutionOrder = SDWebImageDownloaderFIFOExecutionOrder,
    NTESSDWebImageDownloaderLIFOExecutionOrder = SDWebImageDownloaderLIFOExecutionOrder,
};

typedef void(^NTESSDWebImageDownloaderProgressBlock)(NSInteger receivedSize, NSInteger expectedSize);

typedef void(^NTESSDWebImageDownloaderCompletedBlock)(UIImage *image, NSData *data, NSError *error, BOOL finished);

typedef NSDictionary *(^NTESSDWebImageDownloaderHeadersFilterBlock)(NSURL *url, NSDictionary *headers);

@interface NTESSDWebImageDownloader : NSObject

@property (nonatomic, assign) BOOL shouldDecompressImages;

@property (nonatomic, assign) NSInteger maxConcurrentDownloads;

@property (nonatomic, readonly) NSUInteger currentDownloadCount;

@property (nonatomic, assign) NSTimeInterval downloadTimeout;

@property (nonatomic, assign) NTESSDWebImageDownloaderExecutionOrder executionOrder;

@property (nonatomic, strong) NSURLCredential *urlCredential;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, copy) NSString *password;

@property (nonatomic, copy) NTESSDWebImageDownloaderHeadersFilterBlock headersFilter;

+ (NTESSDWebImageDownloader *)sharedDownloader;

- (SDWebImageDownloader *)getSDImageDownloader;

- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;

- (NSString *)valueForHTTPHeaderField:(NSString *)field;

- (void)setOperationClass:(Class)operationClass;

- (id <SDWebImageOperation>)downloadImageWithURL:(NSURL *)url
                                         options:(NTESSDWebImageDownloaderOptions)options
                                        progress:(NTESSDWebImageDownloaderProgressBlock)progressBlock
                                       completed:(NTESSDWebImageDownloaderCompletedBlock)completedBlock;

- (void)setSuspended:(BOOL)suspended;

- (void)cancelAllDownloads;

@end
