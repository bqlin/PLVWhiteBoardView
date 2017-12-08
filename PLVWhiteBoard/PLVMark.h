//
//  PLVMark.h
//  PLVWhiteBoardView
//
//  Created by Bq Lin on 2017/12/6.
//  Copyright © 2017年 POLYV. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PLVMarkType) {
	PLVMarkTypePath,
	PLVMarkTypeRect,
	PLVMarkTypeOval,
	PLVMarkTypeText
};

@interface PLVMark : NSObject

/// 标志符
@property (nonatomic, assign) NSInteger identifier;

/// 类型
@property (nonatomic, assign, readonly) PLVMarkType type;

/// 线条宽度或字体大小
@property (nonatomic, assign) CGFloat size;

/// 笔触颜色
@property (nonatomic, strong) UIColor *color;

/// 点
@property (nonatomic, strong) NSArray<NSValue *> *points;

/// 文字内容
@property (nonatomic, strong) NSString *content;

/// 展示层
@property (nonatomic, strong, readonly) CALayer *layer;

/// 创建墨迹
+ (instancetype)markWithType:(PLVMarkType)type;

/// 更新图层
- (void)updateLayer;

@end
