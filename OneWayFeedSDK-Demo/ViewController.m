//
//  ViewController.m
//  VideoFeedSDK
//
//  Created by lch on 2018/6/8.
//  Copyright © 2018年 ONEWAY. All rights reserved.
//

#import "ViewController.h"
#import "WaveView.h"
#import <CoreMotion/CoreMotion.h>

#define kRedColor [UIColor colorWithRed:255/255.0 green:57/255.0 blue:49/255.0 alpha:1]
#define kGreenColor [UIColor colorWithRed:75/255.0 green:217/255.0 blue:100/255.0 alpha:1]
@interface ViewController ()
@property (nonatomic, strong) CMMotionManager *motionManager;

@end

@interface ViewController ()
@property (nonatomic, strong) UIImageView *batteryImageView;
@property (nonatomic, strong) WaveView *waveView;
@property (nonatomic, strong) UILabel *batteryLevelLabel;

@property (nonatomic, assign) CGFloat batteryLevel;

@end

@implementation ViewController

- (CGFloat)batteryLevel{
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    float batteryLevel = [UIDevice currentDevice].batteryLevel;
    return batteryLevel;
}

- (void)keepBalance{
    
    if (self.motionManager == nil) {
        self.motionManager = [[CMMotionManager alloc] init];
    }
    if (self.motionManager.accelerometerAvailable) {
        //设置加速计采样频率
        self.motionManager.accelerometerUpdateInterval = 0.01f;
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
            double rotation = atan2(accelerometerData.acceleration.x, accelerometerData.acceleration.y) - M_PI;
            self.batteryImageView.transform = CGAffineTransformMakeRotation(rotation);
            self.waveView.transform = CGAffineTransformMakeRotation(rotation);
        }];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat viewX = (self.view.bounds.size.width - 150)/2;
    self.batteryImageView = [[UIImageView alloc] initWithFrame:CGRectMake(viewX, 50, 150, 300)];
    self.batteryImageView.image = [UIImage imageNamed:@"battery"];
    [self.view addSubview:self.batteryImageView];
    
    
    self.batteryLevelLabel = [[UILabel alloc] init];
    self.batteryLevelLabel.textAlignment = NSTextAlignmentCenter;
    if (@available(iOS 8.2, *)) {
        self.batteryLevelLabel.font = [UIFont systemFontOfSize:25.0 weight:UIFontWeightThin];
    } else {
        self.batteryLevelLabel.font = [UIFont systemFontOfSize:25.0];
    }
    [self.view addSubview:self.batteryLevelLabel];
    
    [self updataBattery];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self updataBattery];
}

- (void)updataBattery{
    
    [self.waveView removeFromSuperview];
    self.waveView = nil;
    self.batteryLevelLabel.text = [NSString stringWithFormat:@"当前电量 ：%d%%",(int)(ceilf(self.batteryLevel*100))];

    _waveView = [[WaveView alloc] initWithFrame:CGRectMake(0, 0, 120, self.batteryLevel*300*0.784+(_waveView.waveHeight*1.5))];

    [self.view addSubview:_waveView];
    _waveView.center = self.batteryImageView.center;
    _waveView.waveColor = self.batteryLevel>0.2 ? kGreenColor : kRedColor;
    
    CGRect newFrame = self.waveView.frame;
    newFrame.origin.y = CGRectGetMaxY(self.batteryImageView.frame) - newFrame.size.height - 16;
    self.waveView.frame = newFrame;
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.batteryLevelLabel.frame = CGRectMake(0, CGRectGetMaxY(self.batteryImageView.frame) + 20, self.view.bounds.size.width, 30);
}
@end
