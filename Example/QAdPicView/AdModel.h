//
//  AdModel.h
//  QAdPicView_Example
//
//  Created by Apple on 2018/6/23.
//  Copyright © 2018年 xuekey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdModel : NSObject
/**
 *  广告图片URL
 */
@property (nonatomic, copy) NSURL *adImgURL;

/**
 *  点击执行的代码块(优先级高于adLinkURL)
 */
@property (nonatomic, copy) void(^clickBlock)();

@end
