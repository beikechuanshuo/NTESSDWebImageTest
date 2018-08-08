//
//  UIImage+NTESMultiFormat.h
//  NTESSDWebImageTest
//  对SDWebImageUIImage+MultiFormat进行中间层封装，减少升级第三方库而引起的大量改动
//
//  Created by 李彦军 on 2018/8/8.
//  Copyright © 2018年 NetEase, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NTESMultiFormat)

+ (UIImage *)ntes_sd_imageWithData:(NSData *)data;

@end
