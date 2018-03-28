//
//  PLVWhiteBoardView.m
//  PLVWhiteBoardView
//
//  Created by Bq Lin on 2017/12/6.
//  Copyright © 2017年 POLYV. All rights reserved.
//

#import "PLVWhiteBoardView.h"

@interface PLVWhiteBoardView ()

/// 墨迹数组
@property (nonatomic, strong) NSMutableArray<PLVMark *> *marks;

@end

@implementation PLVWhiteBoardView

#pragma mark - property

- (NSMutableArray *)marks {
	if (!_marks) {
		_marks = [NSMutableArray array];
	}
	return _marks;
}

#pragma mark - public

- (void)addMark:(PLVMark *)mark {
	[self.layer addSublayer:mark.layer];
	[self.marks addObject:mark];
}

- (void)removeMark:(PLVMark *)mark {
	[self.marks removeObject:mark];
	[mark.layer removeFromSuperlayer];
}

- (void)clearMarks {
	for (PLVMark *mark in self.marks) {
		[mark.layer removeFromSuperlayer];
	}
	[self.marks removeAllObjects];
}
@end
