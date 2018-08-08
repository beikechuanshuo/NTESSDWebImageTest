//
//  ViewController.m
//  NTESSDWebImageTest
//
//  Created by 李彦军 on 2018/8/7.
//  Copyright © 2018年 NetEase.com, Inc. All rights reserved.
//

#import "ViewController.h"
#import "NTESSDWebImageHeader.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTestUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 初始化测试UI
- (void)setupTestUI
{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, CGRectGetWidth(self.view.frame)-40, CGRectGetWidth(self.view.frame)-40)];
    [self.view addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor lightGrayColor];
    
    NSURL *url = [NSURL URLWithString:@"http://c.hiphotos.baidu.com/image/pic/item/f9198618367adab4b025268587d4b31c8601e47b.jpg"];
    [self.imageView ntes_sd_setImageWithURL:url placeholderImage:nil];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.imageView.frame)+20, 160, 55)];
    [self.view addSubview:btn];
    [btn ntes_sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533718783796&di=3f76c57fdc8845ae68058bbca0391b48&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F15%2F56%2F54%2F82h58PIC2H7_1024.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(changeBackgroundImageAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *image = [UIImage ntes_sd_animatedGIFNamed:@"1.gif"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.imageView.image = image;
    });
    
}

#pragma mark - Action
- (void)changeBackgroundImageAction:(id)sender
{
    NSArray *bgImageArray = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533719398405&di=fb4c54ac9eda3ce734b1d4ad701ac9ab&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fblog%2F201412%2F05%2F20141205183854_WKNjv.thumb.700_0.gif",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533719398404&di=42c44392b9ecdeddb975d2f0990af1e5&imgtype=0&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fitem%2F201411%2F22%2F20141122132649_Q2YvH.thumb.700_0.gif",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533719398403&di=4274253863bc588633af5c7f1920d939&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201411%2F24%2F20141124125845_cCarG.thumb.700_0.gif",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533719722097&di=8b80888895026480ec23dbf9d27afd80&imgtype=0&src=http%3A%2F%2F2017.zcool.com.cn%2Fcommunity%2F037b7355775cafb0000018c1b222864.gif"];
    
    NSUInteger index = random()%bgImageArray.count;
    [self.imageView ntes_sd_setImageWithURL:[NSURL URLWithString:[bgImageArray objectAtIndex:index]] completed:^(UIImage *image, NSError *error, NTESSDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}

@end
