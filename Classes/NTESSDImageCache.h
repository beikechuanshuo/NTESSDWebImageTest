//
//  NTESSDImageCache.h
//  NTESSDWebImageTest
//  对SDWebImage库中SDImageCache进行中间层封装，减少升级第三方库而引起的大量改动
//
//  Created by 李彦军 on 2018/8/7.
//  Copyright © 2018年 NetEase.com, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SDImageCache.h"

typedef NS_ENUM(NSInteger, NTESSDImageCacheType) {
    NTESSDImageCacheTypeNone = SDImageCacheTypeNone,
    NTESSDImageCacheTypeDisk = SDImageCacheTypeDisk,
    NTESSDImageCacheTypeMemory = SDImageCacheTypeMemory,
};

typedef void(^NTESSDWebImageNoParamsBlock)(void);

typedef void(^NTESSDWebImageQueryCompletedBlock)(UIImage *image, NTESSDImageCacheType cacheType);

typedef void(^NTESSDWebImageCheckCacheCompletionBlock)(BOOL isInCache);

typedef void(^NTESSDWebImageCalculateSizeBlock)(NSUInteger fileCount, NSUInteger totalSize);


@interface NTESSDImageCache : NSObject

@property (nonatomic, assign) BOOL shouldDecompressImages;

@property (nonatomic, assign) BOOL shouldDisableiCloud;

@property (nonatomic, assign) BOOL shouldCacheImagesInMemory;

@property (nonatomic, assign) NSUInteger maxMemoryCost;

@property (nonatomic, assign) NSUInteger maxMemoryCountLimit;

@property (nonatomic, assign) NSInteger maxCacheAge;

@property (nonatomic, assign) NSUInteger maxCacheSize;

+ (NTESSDImageCache *)sharedNTESImageCache;

- (id)initWithNamespace:(NSString *)ns;

- (id)initWithNamespace:(NSString *)ns diskCacheDirectory:(NSString *)directory;

- (SDImageCache *)getSDImageCache;

- (NSString *)makeDiskCachePath:(NSString*)fullNamespace;

- (void)addReadOnlyCachePath:(NSString *)path;

- (void)storeImage:(UIImage *)image forKey:(NSString *)key;

- (void)storeImage:(UIImage *)image forKey:(NSString *)key toDisk:(BOOL)toDisk;

- (void)storeImage:(UIImage *)image recalculateFromImage:(BOOL)recalculate imageData:(NSData *)imageData forKey:(NSString *)key toDisk:(BOOL)toDisk;

- (void)storeImageDataToDisk:(NSData *)imageData forKey:(NSString *)key;

- (NSOperation *)queryDiskCacheForKey:(NSString *)key done:(NTESSDWebImageQueryCompletedBlock)doneBlock;

- (UIImage *)imageFromMemoryCacheForKey:(NSString *)key;

- (UIImage *)imageFromDiskCacheForKey:(NSString *)key;

- (void)removeImageForKey:(NSString *)key;

- (void)removeImageForKey:(NSString *)key withCompletion:(NTESSDWebImageNoParamsBlock)completion;

- (void)removeImageForKey:(NSString *)key fromDisk:(BOOL)fromDisk;

- (void)removeImageForKey:(NSString *)key fromDisk:(BOOL)fromDisk withCompletion:(NTESSDWebImageNoParamsBlock)completion;

- (void)clearMemory;

- (void)clearDiskOnCompletion:(NTESSDWebImageNoParamsBlock)completion;

- (void)clearDisk;

- (void)cleanDiskWithCompletionBlock:(NTESSDWebImageNoParamsBlock)completionBlock;

- (void)cleanDisk;

- (NSUInteger)getSize;

- (NSUInteger)getDiskCount;

- (void)calculateSizeWithCompletionBlock:(NTESSDWebImageCalculateSizeBlock)completionBlock;

- (void)diskImageExistsWithKey:(NSString *)key completion:(NTESSDWebImageCheckCacheCompletionBlock)completionBlock;

- (BOOL)diskImageExistsWithKey:(NSString *)key;

- (NSString *)cachePathForKey:(NSString *)key inPath:(NSString *)path;

- (NSString *)defaultCachePathForKey:(NSString *)key;

@end
