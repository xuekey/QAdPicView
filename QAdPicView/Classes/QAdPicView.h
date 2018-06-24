//
//  AdPicView.h
//  喜马拉雅FM
//
//  Created by  on 16/8/2.
//  Copyright © 2016年 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QAdPicProtocol.h"

typedef void(^LoadImageBlock)(UIImageView *imageView, NSURL *url);

@protocol AdPicViewDelegate <NSObject>

- (void)adPicViewDidSelectedPicModel: (id <QAdPicProtocol>)picM;

@end

@interface QAdPicView : UIView

+ (instancetype)picViewWithLoadImageBlock: (LoadImageBlock)loadBlock;
/**
 *  用于加载图片的代码块, 必须赋值
 */
@property (nonatomic, copy) LoadImageBlock loadBlock;

/**
 *  用于告知外界, 当前滚动到的是哪个广告数据模型
 */
@property (nonatomic, strong) id<AdPicViewDelegate> delegate;

/**
 *  用来展示图片的数据源,必须赋值
 */
@property (nonatomic, strong) NSArray <id <QAdPicProtocol>>*picModels;



@end
