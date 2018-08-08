//
//  NTESSDWebImageDownloader.m
//  NTESSDWebImageTest
//
//  Created by 李彦军 on 2018/8/7.
//  Copyright © 2018年 NetEase.com, Inc. All rights reserved.
//

#import "NTESSDWebImageDownloader.h"

@interface NTESSDWebImageDownloader ()

@property (nonatomic, strong) SDWebImageDownloader *downloader;

@end

@implementation NTESSDWebImageDownloader

#pragma mark - Public Method
+ (NTESSDWebImageDownloader *)sharedDownloader{
    static NTESSDWebImageDownloader *imageDownloader = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imageDownloader = [[NTESSDWebImageDownloader alloc] init];
    });
    return imageDownloader;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.downloader = [[SDWebImageDownloader sharedDownloader] init];
    }
    return self;
}

- (SDWebImageDownloader *)getSDImageDownloader{
    return self.downloader;
}

- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field{
    [self.downloader setValue:value forHTTPHeaderField:field];
}

- (NSString *)valueForHTTPHeaderField:(NSString *)field{
    return [self.downloader valueForHTTPHeaderField:field];
}

- (void)setOperationClass:(Class)operationClass{
    [self.downloader setOperationClass:operationClass];
}

- (id <SDWebImageOperation>)downloadImageWithURL:(NSURL *)url
                                         options:(NTESSDWebImageDownloaderOptions)options
                                        progress:(NTESSDWebImageDownloaderProgressBlock)progressBlock
                                       completed:(NTESSDWebImageDownloaderCompletedBlock)completedBlock{
  return [self.downloader downloadImageWithURL:url options:(SDWebImageDownloaderOptions)options progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (progressBlock) {
            progressBlock(receivedSize,expectedSize);
        }
    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        if (completedBlock) {
            completedBlock(image,data,error,finished);
        }
    }];
}

- (void)setSuspended:(BOOL)suspended{
    [self.downloader setSuspended:suspended];
}

- (void)cancelAllDownloads{
    [self.downloader cancelAllDownloads];
}

#pragma mark - Setter And Getter

- (void)setShouldDecompressImages:(BOOL)shouldDecompressImages{
    self.downloader.shouldDecompressImages = shouldDecompressImages;
}

- (BOOL)shouldDecompressImages{
    return self.downloader.shouldDecompressImages;
}

- (void)setMaxConcurrentDownloads:(NSInteger)maxConcurrentDownloads{
    self.downloader.maxConcurrentDownloads = maxConcurrentDownloads;
}

- (NSInteger)maxConcurrentDownloads{
    return self.downloader.maxConcurrentDownloads;
}

- (NSUInteger)currentDownloadCount{
    return self.downloader.currentDownloadCount;
}

- (void)setDownloadTimeout:(NSTimeInterval)downloadTimeout{
    self.downloader.downloadTimeout = downloadTimeout;
}

- (NSTimeInterval)downloadTimeout{
    return self.downloader.downloadTimeout;
}

- (void)setExecutionOrder:(NTESSDWebImageDownloaderExecutionOrder)executionOrder{
    self.downloader.executionOrder = (SDWebImageDownloaderExecutionOrder)executionOrder;
}

- (NTESSDWebImageDownloaderExecutionOrder)executionOrder{
    
    return (NTESSDWebImageDownloaderExecutionOrder)self.downloader.executionOrder;
}

- (void)setUrlCredential:(NSURLCredential *)urlCredential{
    self.downloader.urlCredential = urlCredential;
}

- (NSURLCredential *)urlCredential{
    return self.downloader.urlCredential;
}

- (void)setUsername:(NSString *)username{
    self.downloader.username = username;
}

- (NSString *)username{
    return self.downloader.username;
}

- (void)setPassword:(NSString *)password{
    self.downloader.password = password;
}

- (NSString *)password{
    return self.downloader.password;
}

- (void)setHeadersFilter:(NTESSDWebImageDownloaderHeadersFilterBlock)headersFilter{
    self.downloader.headersFilter = (SDWebImageDownloaderHeadersFilterBlock)headersFilter;
}

- (NTESSDWebImageDownloaderHeadersFilterBlock)headersFilter
{
    return (NTESSDWebImageDownloaderHeadersFilterBlock)self.downloader.headersFilter;
}

@end
