//
//  QViewController.m
//  QAdPicView
//
//  Created by xuekey on 06/23/2018.
//  Copyright (c) 2018 xuekey. All rights reserved.
//

#import "QViewController.h"
#import "QAdPicView.h"
#import "UIImageView+XMGExtension.h"
#import "AdModel.h"

@interface QViewController ()
@property (nonatomic, strong) QAdPicView *adPicView;

@end

@implementation QViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.adPicView.frame = CGRectMake(0, 0, kScreenWidth, 150);
    
    //考虑不同的图片会展示不同的内容，所以每个model是点击是不同的事件
    model *m1 = [[model alloc] init];
    m1.clickBlock= ^(){
        NSLog(@"%@",m1.adImgURL);
    };
    m1.adImgURL = [NSURL URLWithString   :@"http://img3.duitang.com/uploads/item/201604/17/20160417132709_WudYa.jpeg"];
    
    model *m2 = [[model alloc] init];
    m2.adImgURL = [NSURL URLWithString:@"http://a3.topitme.com/1/eb/20/11248727599a220eb1o.jpg"];
    m2.clickBlock= ^(){
        NSLog(@"%@",m2.adImgURL);
    };
    model *m3 = [[model alloc] init];
    m3.adImgURL = [NSURL URLWithString:@"http://img4.duitang.com/uploads/item/201406/22/20140622144748_2PvLa.jpeg"];
    m3.clickBlock= ^(){
        NSLog(@"%@",m3.adImgURL);
    };
    NSArray *a = @[m1,m2,m3];
    self.adPicView.picModels = a;
    
    
    UIImageView *imageV1 = [[UIImageView alloc] init];
    [imageV1 setURLImageWithURL:m1.adImgURL progress:nil complete:nil];
    
    UIImageView *imageV2 = [[UIImageView alloc] init];
    [imageV2 setURLImageWithURL:m2.adImgURL progress:nil complete:nil];
    
    UIImageView *imageV3 = [[UIImageView alloc] init];
    [imageV3  setURLImageWithURL:m3.adImgURL progress:nil complete:nil];;
    
    self.adPicView.loadBlock(imageV1, m1.adImgURL);
    self.adPicView.loadBlock(imageV2, m2.adImgURL);
    self.adPicView.loadBlock(imageV3, m3.adImgURL);
    
    [self.view addSubview:self.adPicView];
    self.adPicView.backgroundColor = [UIColor redColor];
}

-(QAdPicView *)adPicView {
    if (!_adPicView) {
        QAdPicView *adPicView = [QAdPicView picViewWithLoadImageBlock:^(UIImageView *imageView, NSURL *url) {
            
            [imageView setURLImageWithURL:url progress:nil complete:nil];
        }];
        _adPicView = adPicView;
    }
    return _adPicView;
}
@end
