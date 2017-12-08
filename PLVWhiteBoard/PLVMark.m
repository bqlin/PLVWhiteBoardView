//
//  PLVMark.m
//  PLVWhiteBoardView
//
//  Created by Bq Lin on 2017/12/6.
//  Copyright © 2017年 POLYV. All rights reserved.
//

#import "PLVMark.h"

@interface PLVMark ()

/// 类型
@property (nonatomic, assign) PLVMarkType type;

/// 展示层
@property (nonatomic, strong) CALayer *layer;

@end

@implementation PLVMark

#pragma mark - property

- (void)setPoints:(NSArray<NSValue *> *)points {
	_points = points;
	[self updateLayer];
}

#pragma mark - public

+ (instancetype)markWithType:(PLVMarkType)type {
	PLVMark *mark = [[PLVMark alloc] init];
	mark.type = type;
	return mark;
}

- (void)updateLayer {
	switch (self.type) {
		case PLVMarkTypePath:{
			CGPoint location = self.points.firstObject.CGPointValue;
			UIBezierPath *path = [self pathWithWidth:self.size location:location];
			
			for (int i = 1; i < self.points.count; i++) {
				CGPoint point = self.points[i].CGPointValue;
				[path addLineToPoint:point];
			}
			CAShapeLayer *shapeLayer = [self buildShapeLayer];
			shapeLayer.path = path.CGPath;
		}break;
		case PLVMarkTypeRect:{
			CGPoint startPoint = self.points.firstObject.CGPointValue;
			CGPoint endPoint = self.points.lastObject.CGPointValue;
			CGFloat width = endPoint.x - startPoint.x;
			CGFloat height = endPoint.y - startPoint.y;
			UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(startPoint.x, startPoint.y, width, height)];
			CAShapeLayer *shapeLayer = [self buildShapeLayer];
			shapeLayer.path = path.CGPath;
		}break;
		case PLVMarkTypeOval:{
			CGPoint startPoint = self.points.firstObject.CGPointValue;
			CGPoint endPoint = self.points.lastObject.CGPointValue;
			CGFloat width = endPoint.x - startPoint.x;
			CGFloat height = endPoint.y - startPoint.y;
			UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(startPoint.x, startPoint.y, width, height)];
			CAShapeLayer *shapeLayer = [self buildShapeLayer];
			shapeLayer.path = path.CGPath;
		}break;
		case PLVMarkTypeText:{
			[self buildTextLayer];
		}break;
		default:{}break;
	}
}


#pragma mark - private

- (UIBezierPath *)pathWithWidth:(CGFloat)width location:(CGPoint)location {
	UIBezierPath *path = [[UIBezierPath alloc] init];
	path.lineWidth = width;
	path.lineCapStyle = kCGLineCapRound;
	path.lineJoinStyle = kCGLineCapRound;
	[path moveToPoint:location];
	return path;
}

- (CAShapeLayer *)buildShapeLayer {
	CAShapeLayer *shapeLayer = [CAShapeLayer layer];
	self.layer = shapeLayer;
	shapeLayer.backgroundColor = [UIColor clearColor].CGColor;
	shapeLayer.fillColor = [UIColor clearColor].CGColor;
	shapeLayer.lineCap = kCALineCapRound;
	shapeLayer.lineJoin = kCALineJoinRound;
	shapeLayer.strokeColor = self.color.CGColor;
	shapeLayer.lineWidth = self.size;
	shapeLayer.contentsScale = [UIScreen mainScreen].scale;
	return shapeLayer;
}

- (CATextLayer *)buildTextLayer {
	CATextLayer *textLayer = [CATextLayer layer];
	self.layer = textLayer;
	CGPoint textOrigin = self.points.firstObject.CGPointValue;
	CGSize textSize = [self.content sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:self.size]}];
	textLayer.frame = (CGRect){textOrigin, textSize};
	textLayer.string = self.content;
	textLayer.fontSize = self.size;
	textLayer.foregroundColor = self.color.CGColor;
	textLayer.borderWidth = 1;
	textLayer.borderColor = self.color.CGColor;
	textLayer.contentsScale = [UIScreen mainScreen].scale;
	return textLayer;
}

@end
