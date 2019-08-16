# YKCornersView


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

YKCornersView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YKCornersView'
```
## 支持的功能
目前版本支持的功能如下：
1. 自定义圆角方向
2. 自定义边线颜色和宽度
3. 自定义内部填充色

## 用到的技术
### UIBezierPath + CAShapeLayer 绘制
使用 UIBezierPath + CAShapeLayer 绘制圆角、边线和填充色，核心代码如下：
```
UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:self._radiusCorner cornerRadii:CGSizeMake(self._radiusFloat, 0)];
self.shapeLayer = [CAShapeLayer layer];
self.shapeLayer.path = maskPath.CGPath;
self.shapeLayer.lineWidth = self._lineWidth;
self.shapeLayer.strokeColor = self._lineColor.CGColor;
self.shapeLayer.fillColor = self._fillColor.CGColor;
self.shapeLayer.frame = self.bounds;
[self.layer addSublayer:self.shapeLayer];
```

### 类别添加属性
类别是无法直接添加属性的，但是使用 runtime 可以实现，部分代码如下：
```
- (CGFloat)_radiusFloat {
return [objc_getAssociatedObject(self, &radiusFloatKey) floatValue];
}

- (void)set_radiusFloat:(CGFloat)radiusFloat {
objc_setAssociatedObject(self, &radiusFloatKey, [NSNumber numberWithFloat:radiusFloat], OBJC_ASSOCIATION_COPY);
}
```
### 链式方法
需要设置的属性达到 5 个，一个一个设置要占 5 行，还是链式的写法，一行搞定比较爽快：
```
//圆角的方向
- (UIView * (^)(UIRectCorner))radiusCorner;
//圆角的弧度
- (UIView * (^)(CGFloat))radiusFloat;
//边线长度
- (UIView * (^)(CGFloat))lineWidth;
//边线颜色
- (UIView * (^)(UIColor *))lineColor;
//填充颜色
- (UIView * (^)(UIColor *))fillColor;
```

## 使用方法如下：
```
UIView *oneView = [[UIView alloc] init];
[self.view addSubview:oneView];
[oneView mas_makeConstraints:^(MASConstraintMaker *make) {
make.top.mas_equalTo(100);
make.centerX.equalTo(self.view);
make.width.mas_equalTo(200);
make.height.mas_equalTo(40);
}];
oneView.radiusCorner(UIRectCornerTopLeft).radiusFloat(15).fillColor([UIColor redColor]).lineColor([UIColor blueColor]).lineWidth(0.5);
[oneView manualDrawing];
```

## Author

YakirLove, 282335315@qq.com

## License

YKCornersView is available under the MIT license. See the LICENSE file for more info.
