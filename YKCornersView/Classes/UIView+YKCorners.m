//
//  UIView+YKCorners.m
//  YKCornersButton_Example
//
//  Created by 吴焰基 on 2019/8/14.
//  Copyright © 2019 SDGH-technology. All rights reserved.
//

#import "UIView+YKCorners.h"
#import <objc/runtime.h>

static NSString *radiusFloatKey = @"radiusFloatKey";
static NSString *radiusCornerKey = @"radiusCornerKey";
static NSString *lineColorKey = @"lineColorKey";
static NSString *lineWidthKey = @"lineWidthKey";
static NSString *fillColorKey = @"fillColorKey";
static NSString *shapeLayerKey = @"shapeLayerKey";

@interface UIView()
/**
 圆角弧度
 */
@property (nonatomic, assign) CGFloat _radiusFloat;
/**
 圆角方向
 */
@property (nonatomic, assign) UIRectCorner _radiusCorner;
/**
 边线颜色
 */
@property (nonatomic, strong) UIColor *_lineColor;
/**
 边线宽度
 */
@property (nonatomic, assign) CGFloat _lineWidth;
/**
 内部颜色
 */
@property (nonatomic, strong) UIColor *_fillColor;
/**
 绘制 layer
 */
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation UIView (YKCorners)

#pragma mark - getter

- (CGFloat)_radiusFloat {
    return [objc_getAssociatedObject(self, &radiusFloatKey) floatValue];
}
- (UIRectCorner)_radiusCorner {
    return [objc_getAssociatedObject(self, &radiusCornerKey) unsignedIntegerValue];
}
- (UIColor *)_lineColor {
    return objc_getAssociatedObject(self, &lineColorKey);
}
- (CGFloat)_lineWidth {
    return [objc_getAssociatedObject(self, &lineWidthKey) floatValue];
}
- (UIColor *)_fillColor {
    return objc_getAssociatedObject(self, &fillColorKey);
}
- (CAShapeLayer *)shapeLayer {
    return objc_getAssociatedObject(self, &shapeLayerKey);
}

#pragma mark - setter
- (void)set_radiusFloat:(CGFloat)radiusFloat {
    objc_setAssociatedObject(self, &radiusFloatKey, [NSNumber numberWithFloat:radiusFloat], OBJC_ASSOCIATION_COPY);
}
- (void)set_radiusCorner:(NSUInteger)radiusCorner {
    objc_setAssociatedObject(self, &radiusCornerKey, [NSNumber numberWithUnsignedInteger:radiusCorner], OBJC_ASSOCIATION_COPY);
}
- (void)set_lineColor:(UIColor *)lineColor {
    objc_setAssociatedObject(self, &lineColorKey, lineColor, OBJC_ASSOCIATION_RETAIN);
}
- (void)set_lineWidth:(CGFloat)radiusFloat {
    objc_setAssociatedObject(self, &lineWidthKey, [NSNumber numberWithFloat:radiusFloat], OBJC_ASSOCIATION_COPY);
}
- (void)set_fillColor:(UIColor *)fillColor {
    objc_setAssociatedObject(self, &fillColorKey, fillColor, OBJC_ASSOCIATION_RETAIN);
}
- (void)setShapeLayer:(CAShapeLayer *)shapeLayer {
    objc_setAssociatedObject(self, &shapeLayerKey, shapeLayer, OBJC_ASSOCIATION_RETAIN);
}

#pragma mark - method

- (UIView * (^)(UIRectCorner))radiusCorner {
    return ^(UIRectCorner radiusCorner) {
        self._radiusCorner = radiusCorner;
        return self;
    };
}

- (UIView * (^)(CGFloat))radiusFloat {
    return ^(CGFloat radiusFloat) {
        self._radiusFloat = radiusFloat;
        return self;
    };
}

- (UIView * (^)(CGFloat))lineWidth {
    return ^(CGFloat lineWidth) {
        self._lineWidth = lineWidth;
        return self;
    };
}


- (UIView * (^)(UIColor *))lineColor {
    return ^(UIColor *lineColor) {
        self._lineColor = lineColor;
        return self;
    };
}


- (UIView * (^)(UIColor *))fillColor {
    return ^(UIColor *fillColor) {
        self._fillColor = fillColor;
        return self;
    };
}

-(void)manualDrawing
{
    [self.shapeLayer removeFromSuperlayer];
    self.shapeLayer = nil;
    //延时处理是为了让自动布局生效
    [self performSelector:@selector(drawing) withObject:nil afterDelay:0.1];
}

#pragma mark - 绘制方法

- (void)drawing
{
    if( self._radiusFloat == 0)
    {
        return;
    }
    
    if(self.shapeLayer)
    {
        return;
    }

    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:self._radiusCorner cornerRadii:CGSizeMake(self._radiusFloat, 0)];
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.path = maskPath.CGPath;
    self.shapeLayer.lineWidth = self._lineWidth;
    self.shapeLayer.strokeColor = self._lineColor.CGColor;
    self.shapeLayer.fillColor = self._fillColor.CGColor;
    self.shapeLayer.frame = self.bounds;
    [self.layer addSublayer:self.shapeLayer];
}

@end
