//
//  UIImage+NTESGIF.m
//  NTESSDWebImageTest
//
//  Created by 李彦军 on 2018/8/8.
//  Copyright © 2018年 NetEase, Inc. All rights reserved.
//

#import "UIImage+NTESGIF.h"
#import "UIImage+GIF.h"

@implementation UIImage (NTESGIF)

+ (UIImage *)ntes_sd_animatedGIFNamed:(NSString *)name{
    return [UIImage sd_animatedGIFNamed:name];
}

+ (UIImage *)ntes_sd_animatedGIFWithData:(NSData *)data{
    return [UIImage sd_animatedGIFWithData:data];
}

- (UIImage *)ntes_sd_animatedImageByScalingAndCroppingToSize:(CGSize)size{
    return [self sd_animatedImageByScalingAndCroppingToSize:size];
}

@end
