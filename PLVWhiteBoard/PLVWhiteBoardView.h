//
//  PLVWhiteBoardView.h
//  PLVWhiteBoardView
//
//  Created by Bq Lin on 2017/12/6.
//  Copyright © 2017年 POLYV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLVMark.h"

@interface PLVWhiteBoardView : UIView

/// 墨迹数组
@property (nonatomic, strong, readonly) NSMutableArray<PLVMark *> *marks;

/// 添加墨迹
- (void)addMark:(PLVMark *)mark;
- (void)removeMark:(PLVMark *)mark;
- (void)clearMarks;

@end
