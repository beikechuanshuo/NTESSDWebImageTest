//
//  NTESSDImageCache.m
//  NTESSDWebImageTest
//
//  Created by 李彦军 on 2018/8/7.
//  Copyright © 2018年 NetEase.com, Inc. All rights reserved.
//

#import "NTESSDImageCache.h"
#import "SDImageCache.h"

@interface NTESSDImageCache()

@property (nonatomic, strong) SDImageCache *cache;

@end

@implementation NTESSDImageCache
#pragma mark - Public Method
+ (NTESSDImageCache *)sharedNTESImageCache{
    static NTESSDImageCache *imageCache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imageCache = [[NTESSDImageCache alloc] init];
    });
    
    return imageCache;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.cache = [[SDImageCache sharedImageCache] init];
    }
    
    return self;
}

- (id)initWithNamespace:(NSString *)ns{
    self = [super init];
    if (self){
        self.cache = [[SDImageCache sharedImageCache] initWithNamespace:ns];
    }
    return self;
}

- (id)initWithNamespace:(NSString *)ns diskCacheDirectory:(NSString *)directory{
    self = [super init];
    if (self){
        self.cache = [[SDImageCache sharedImageCache] initWithNamespace:ns diskCacheDirectory:directory];
    }
    return self;
}

- (SDImageCache *)getSDImageCache
{
    return self.cache;
}

- (NSString *)makeDiskCachePath:(NSString*)fullNamespace{
    return [self.cache makeDiskCachePath:fullNamespace];
}

- (void)addReadOnlyCachePath:(NSString *)path{
    [self.cache addReadOnlyCachePath:path];
}

- (void)storeImage:(UIImage *)image forKey:(NSString *)key{
    [self.cache storeImage:image forKey:key];
}

- (void)storeImage:(UIImage *)image forKey:(NSString *)key toDisk:(BOOL)toDisk{
    [self.cache storeImage:image forKey:key toDisk:toDisk];
}

- (void)storeImage:(UIImage *)image recalculateFromImage:(BOOL)recalculate imageData:(NSData *)imageData forKey:(NSString *)key toDisk:(BOOL)toDisk{
    [self.cache storeImage:image recalculateFromImage:recalculate imageData:imageData forKey:key toDisk:toDisk];
}

- (void)storeImageDataToDisk:(NSData *)imageData forKey:(NSString *)key{
    [self.cache storeImageDataToDisk:imageData forKey:key];
}

- (NSOperation *)queryDiskCacheForKey:(NSString *)key done:(NTESSDWebImageQueryCompletedBlock)doneBlock{
   return [self.cache queryDiskCacheForKey:key done:^(UIImage *image, SDImageCacheType cacheType) {
        if (doneBlock) {
            doneBlock(image,(NTESSDImageCacheType)cacheType);
        }
    }];
}


- (UIImage *)imageFromMemoryCacheForKey:(NSString *)key{
    return [self.cache imageFromMemoryCacheForKey:key];
}

- (UIImage *)imageFromDiskCacheForKey:(NSString *)key{
    return [self.cache imageFromDiskCacheForKey:key];
}

- (void)removeImageForKey:(NSString *)key{
    [self.cache removeImageForKey:key];
}

- (void)removeImageForKey:(NSString *)key withCompletion:(NTESSDWebImageNoParamsBlock)completion{
    [self.cache removeImageForKey:key withCompletion:^{
        if (completion) {
            completion();
        }
    }];
}

- (void)removeImageForKey:(NSString *)key fromDisk:(BOOL)fromDisk{
    [self.cache removeImageForKey:key fromDisk:fromDisk];
}

- (void)removeImageForKey:(NSString *)key fromDisk:(BOOL)fromDisk withCompletion:(NTESSDWebImageNoParamsBlock)completion{
    [self.cache removeImageForKey:key fromDisk:fromDisk withCompletion:^{
        if (completion) {
            completion();
        }
    }];
}

- (void)clearMemory{
    [self.cache clearMemory];
}

- (void)clearDiskOnCompletion:(NTESSDWebImageNoParamsBlock)completion{
    [self.cache clearDiskOnCompletion:^{
        if (completion) {
            completion();
        }
    }];
}

- (void)clearDisk{
    [self.cache clearDisk];
}

- (void)cleanDiskWithCompletionBlock:(NTESSDWebImageNoParamsBlock)completionBlock{
    [self.cache cleanDiskWithCompletionBlock:^{
        if (completionBlock) {
            completionBlock();
        }
    }];
}

- (void)cleanDisk{
    [self.cache cleanDisk];
}

- (NSUInteger)getSize{
    return [self.cache getSize];
}

- (NSUInteger)getDiskCount{
    return [self.cache getDiskCount];
}

- (void)calculateSizeWithCompletionBlock:(NTESSDWebImageCalculateSizeBlock)completionBlock{
    [self.cache calculateSizeWithCompletionBlock:^(NSUInteger fileCount, NSUInteger totalSize) {
        if (completionBlock) {
            completionBlock(fileCount,totalSize);
        }
    }];
}

- (void)diskImageExistsWithKey:(NSString *)key completion:(NTESSDWebImageCheckCacheCompletionBlock)completionBlock{
    [self.cache diskImageExistsWithKey:key completion:^(BOOL isInCache) {
        if (completionBlock) {
            completionBlock(isInCache);
        }
    }];
}

- (BOOL)diskImageExistsWithKey:(NSString *)key{
    return [self.cache diskImageExistsWithKey:key];
}

- (NSString *)cachePathForKey:(NSString *)key inPath:(NSString *)path{
    return [self.cache cachePathForKey:key inPath:path];
}

- (NSString *)defaultCachePathForKey:(NSString *)key{
    return [self.cache defaultCachePathForKey:key];
}

#pragma mark - Setter And Getter
- (void)setShouldDecompressImages:(BOOL)shouldDecompressImages{
    self.cache.shouldDecompressImages = shouldDecompressImages;
}

- (BOOL)shouldDecompressImages{
    return self.cache.shouldDecompressImages;
}

- (void)setShouldDisableiCloud:(BOOL)shouldDisableiCloud{
    self.cache.shouldDisableiCloud = shouldDisableiCloud;
}

- (BOOL)shouldDisableiCloud{
    return self.cache.shouldDisableiCloud;
}

- (void)setShouldCacheImagesInMemory:(BOOL)shouldCacheImagesInMemory{
    self.cache.shouldCacheImagesInMemory = shouldCacheImagesInMemory;
}

- (BOOL)shouldCacheImagesInMemory{
    return self.shouldCacheImagesInMemory;
}

- (void)setMaxMemoryCost:(NSUInteger)maxMemoryCost{
    self.cache.maxMemoryCost = maxMemoryCost;
}

- (NSUInteger)maxMemoryCost{
    return self.cache.maxMemoryCost;
}

- (void)setMaxMemoryCountLimit:(NSUInteger)maxMemoryCountLimit{
    self.cache.maxMemoryCountLimit = maxMemoryCountLimit;
}

- (NSUInteger)maxMemoryCountLimit{
    return self.cache.maxMemoryCountLimit;
}

- (void)setMaxCacheAge:(NSInteger)maxCacheAge{
    self.cache.maxCacheAge = maxCacheAge;
}

- (NSInteger)maxCacheAge{
    return self.cache.maxCacheAge;
}

- (void)setMaxCacheSize:(NSUInteger)maxCacheSize{
    self.cache.maxCacheSize = maxCacheSize;
}

- (NSUInteger)maxCacheSize{
    return self.cache.maxCacheSize;
}

@end
