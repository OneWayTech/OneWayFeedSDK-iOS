//
//  WaveView.h
//  LMWave
//
//  Created by 凯东源 on 2017/11/9.
//  Copyright © 2017年 LM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaveView : UIView


/**
 移动速度，默认为2
 */
@property (assign, nonatomic) CGFloat speed;


/**
 偏移量，默认为0
 */
@property (assign, nonatomic) CGFloat offset;


/**
 波浪宽度，默认为2
 */
@property (assign, nonatomic) CGFloat waveWidth;


/**
 波浪高度，默认为10
 */
@property (assign, nonatomic) CGFloat waveHeight;

@property (strong, nonatomic) UIColor *waveColor;


@end
