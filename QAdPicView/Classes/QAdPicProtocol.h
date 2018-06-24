//
//  AdPicProtocol.h
//  控件封装
//
//  Created by  on 16/9/10.
//  Copyright © 2016年 . All rights reserved.
//

@protocol QAdPicProtocol <NSObject>

/**
 *  广告图片URL
 */
@property (nonatomic, copy, readonly) NSURL *adImgURL;


/**
 *  点击执行的代码块(优先级高于adLinkURL)
 */
@property (nonatomic, copy) void(^clickBlock)();

@end
