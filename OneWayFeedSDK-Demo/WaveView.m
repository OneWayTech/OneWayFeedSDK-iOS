//
//  WaveView.m
//  LMWave
//
//  Created by 凯东源 on 2017/11/9.
//  Copyright © 2017年 LM. All rights reserved.
//

#import "WaveView.h"

@interface WaveView ()

@property (strong, nonatomic) CAShapeLayer *bgLayer;

@property (strong, nonatomic) CAShapeLayer *bgLayer_;

@property (strong, nonatomic) UIBezierPath *bgPath;

@property (assign, nonatomic) int fps;

@end

@implementation WaveView


- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        _speed = 0.5;
        _offset = 0;
        _waveWidth = frame.size.width;
        _waveHeight = 10;
        _waveColor = [UIColor lightGrayColor];
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIBezierPath *rectanglePath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(13, 13)];
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.frame = self.bounds;
        layer.path = rectanglePath.CGPath;
        self.layer.mask = layer;
        
        
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // 第一个layer
    _bgLayer = [CAShapeLayer layer];
    _bgLayer.lineWidth = 1;
    _bgLayer.strokeColor = [UIColor clearColor].CGColor;
    _bgLayer.fillColor = self.waveColor.CGColor;
    _bgLayer.opacity = 0.5;
    [self.layer addSublayer:_bgLayer];
    
    // 第二个layer
    _bgLayer_ = [CAShapeLayer layer];
    _bgLayer_.lineWidth = 1;
    _bgLayer_.strokeColor = [UIColor clearColor].CGColor;
    _bgLayer_.fillColor = self.waveColor.CGColor;
    _bgLayer_.opacity = 0.5;
    [self.layer addSublayer:_bgLayer_];
    
    // 贝塞尔
    _bgPath = [UIBezierPath bezierPath];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 / 50.0 target:self selector:@selector(anmimotion) userInfo:nil repeats:YES];
    
//    [self anmimotion];
}


- (void)anmimotion {
    _fps++;
    //NSLog(@"%d", _fps);
    // 第一个layer
    [_bgPath removeAllPoints];
    _offset += _speed;
    [_bgPath moveToPoint:CGPointMake(0, CGRectGetHeight(self.frame))];
    for (int i = 0; i <= _waveWidth; i++) {
        CGFloat y = sin(2.2 * M_PI / _waveWidth * (i + _offset)) * _waveHeight + _waveHeight;
        [_bgPath addLineToPoint:CGPointMake(i, y)];
    }
    [_bgPath addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    _bgLayer.fillColor = _waveColor.CGColor;
    _bgLayer.path = _bgPath.CGPath;
    
    // 第二个layer
    [_bgPath removeAllPoints];
    [_bgPath moveToPoint:CGPointMake(0, CGRectGetHeight(self.frame))];
    for (int i = 0; i <= _waveWidth; i++) {
         CGFloat y = sin(2.2 * M_PI / _waveWidth * (i + _offset * 3 + _waveWidth / 6)) * _waveHeight + _waveHeight;
        [_bgPath addLineToPoint:CGPointMake(i, y)];
    }
    [_bgPath addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    _bgLayer_.fillColor = self.waveColor.CGColor;
    _bgLayer_.path = _bgPath.CGPath;
}

@end
