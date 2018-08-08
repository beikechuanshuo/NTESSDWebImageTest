//
//  UIImage+NTESGIF.h
//  NTESSDWebImageTest
//  对SDWebImage库中UIImage+GIF进行中间层封装，减少升级第三方库而引起的大量改动
//
//  Created by 李彦军 on 2018/8/8.
//  Copyright © 2018年 NetEase, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NTESGIF)

+ (UIImage *)ntes_sd_animatedGIFNamed:(NSString *)name;

+ (UIImage *)ntes_sd_animatedGIFWithData:(NSData *)data;

- (UIImage *)ntes_sd_animatedImageByScalingAndCroppingToSize:(CGSize)size;

@end
