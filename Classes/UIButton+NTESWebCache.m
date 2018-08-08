//
//  UIButton+NTESWebCache.m
//  NTESSDWebImageTest
//
//  Created by 李彦军 on 2018/8/8.
//  Copyright © 2018年 NetEase, Inc. All rights reserved.
//

#import "UIButton+NTESWebCache.h"
#import "UIButton+WebCache.h"

@implementation UIButton (NTESWebCache)

- (NSURL *)ntes_sd_currentImageURL{
    return [self sd_currentImageURL];
}

- (NSURL *)ntes_sd_imageURLForState:(UIControlState)state{
    return [self sd_imageURLForState:state];
}

- (void)ntes_sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state{
    [self sd_setImageWithURL:url forState:state];
}

- (void)ntes_sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder{
    [self sd_setImageWithURL:url forState:state placeholderImage:placeholder];
}

- (void)ntes_sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(NTESSDWebImageOptions)options{
    [self sd_setImageWithURL:url forState:state placeholderImage:placeholder options:(SDWebImageOptions)options];
}

- (void)ntes_sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state completed:(NTESSDWebImageCompletionBlock)completedBlock{
    [self sd_setImageWithURL:url forState:state completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image,error,(NTESSDImageCacheType)cacheType,imageURL);
        }
    }];
}

- (void)ntes_sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(NTESSDWebImageCompletionBlock)completedBlock{
    [self sd_setImageWithURL:url forState:state placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image,error,(NTESSDImageCacheType)cacheType,imageURL);
        }
    }];
}

- (void)ntes_sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(NTESSDWebImageOptions)options completed:(NTESSDWebImageCompletionBlock)completedBlock{
    [self sd_setImageWithURL:url forState:state placeholderImage:placeholder options:(SDWebImageOptions)options completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image,error,(NTESSDImageCacheType)cacheType,imageURL);
        }
    }];
}

- (void)ntes_sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state{
    [self sd_setBackgroundImageWithURL:url forState:state];
}

- (void)ntes_sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder{
    [self sd_setBackgroundImageWithURL:url forState:state placeholderImage:placeholder];
}

- (void)ntes_sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(NTESSDWebImageOptions)options{
    [self sd_setBackgroundImageWithURL:url forState:state placeholderImage:placeholder options:(SDWebImageOptions)options];
}

- (void)ntes_sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state completed:(NTESSDWebImageCompletionBlock)completedBlock{
    [self sd_setBackgroundImageWithURL:url forState:state completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
        if (completedBlock) {
            completedBlock(image,error,(NTESSDImageCacheType)cacheType,imageURL);
        }
    }];
}

- (void)ntes_sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(NTESSDWebImageCompletionBlock)completedBlock{
    [self sd_setBackgroundImageWithURL:url forState:state placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (completedBlock) {
            completedBlock(image,error,(NTESSDImageCacheType)cacheType,imageURL);
        }
    }];
}

- (void)ntes_sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(NTESSDWebImageOptions)options completed:(NTESSDWebImageCompletionBlock)completedBlock{
    [self sd_setBackgroundImageWithURL:url forState:state placeholderImage:placeholder options:(SDWebImageOptions)options completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (completedBlock) {
            completedBlock(image,error,(NTESSDImageCacheType)cacheType,imageURL);
        }
    }];
}

- (void)ntes_sd_cancelImageLoadForState:(UIControlState)state{
    [self sd_cancelImageLoadForState:state];
}

- (void)ntes_sd_cancelBackgroundImageLoadForState:(UIControlState)state{
    [self sd_cancelBackgroundImageLoadForState:state];
}

@end
