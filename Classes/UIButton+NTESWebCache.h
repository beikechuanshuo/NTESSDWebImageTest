//
//  UIButton+NTESWebCache.h
//  NTESSDWebImageTest
//  对SDWebImage库中UIButton+WebCache进行中间层封装，减少升级第三方库而引起的大量改动
//
//  Created by 李彦军 on 2018/8/8.
//  Copyright © 2018年 NetEase, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NTESSDWebImageManager.h"

@interface UIButton (NTESWebCache)

- (NSURL *)ntes_sd_currentImageURL;

- (NSURL *)ntes_sd_imageURLForState:(UIControlState)state;

- (void)ntes_sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state;

- (void)ntes_sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder;

- (void)ntes_sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(NTESSDWebImageOptions)options;

- (void)ntes_sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state completed:(NTESSDWebImageCompletionBlock)completedBlock;

- (void)ntes_sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(NTESSDWebImageCompletionBlock)completedBlock;

- (void)ntes_sd_setImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(NTESSDWebImageOptions)options completed:(NTESSDWebImageCompletionBlock)completedBlock;

- (void)ntes_sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state;

- (void)ntes_sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder;

- (void)ntes_sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(NTESSDWebImageOptions)options;

- (void)ntes_sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state completed:(NTESSDWebImageCompletionBlock)completedBlock;

- (void)ntes_sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(NTESSDWebImageCompletionBlock)completedBlock;

- (void)ntes_sd_setBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder options:(NTESSDWebImageOptions)options completed:(NTESSDWebImageCompletionBlock)completedBlock;

- (void)ntes_sd_cancelImageLoadForState:(UIControlState)state;

- (void)ntes_sd_cancelBackgroundImageLoadForState:(UIControlState)state;

@end
