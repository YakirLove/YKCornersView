//
//  YKViewController.m
//  YKCornersView
//
//  Created by SDGH-technology on 08/14/2019.
//  Copyright (c) 2019 SDGH-technology. All rights reserved.
//

#import "YKViewController.h"
#import <Masonry/Masonry.h>
#import "UIView+YKCorners.h"

@interface YKViewController ()

@end

@implementation YKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
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
    
    UIView *twoView = [[UIView alloc] init];
    [self.view addSubview:twoView];
    [twoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(200);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(40);
    }];
    twoView.radiusCorner(UIRectCornerTopLeft | UIRectCornerTopRight).radiusFloat(15).fillColor([UIColor redColor]).lineColor([UIColor blueColor]).lineWidth(0.5);
    [twoView manualDrawing];
    
    
    UIView *threeView = [[UIView alloc] init];
    [self.view addSubview:threeView];
    [threeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(300);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(40);
    }];
    threeView.radiusCorner(UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft).radiusFloat(15).fillColor([UIColor redColor]).lineColor([UIColor blueColor]).lineWidth(0.5);
    [threeView manualDrawing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
