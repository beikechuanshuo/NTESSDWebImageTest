//
//  UIImage+NTESMultiFormat.m
//  NTESSDWebImageTest
//
//  Created by 李彦军 on 2018/8/8.
//  Copyright © 2018年 NetEase, Inc. All rights reserved.
//

#import "UIImage+NTESMultiFormat.h"
#import "UIImage+MultiFormat.h"

@implementation UIImage (NTESMultiFormat)

+ (UIImage *)ntes_sd_imageWithData:(NSData *)data{
   return [UIImage sd_imageWithData:data];
}

@end
