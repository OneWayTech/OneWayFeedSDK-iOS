//
//  OneWayFeedSDK.h
//  OneWayFeedSDK
//
//  Created by lch on 2018/5/28.
//  Copyright © 2018年 ONEWAY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface OneWayFeedSDK : NSObject


+ (void)configureWithAppkey:(NSString *)AppKey appSecret:(NSString *)AppSecret;

+ (UINavigationController *)nativeWithTabBarTitle:(NSString *)title tabBarImage:(UIImage *)image;
+ (UIViewController *)HTML5WithTabBarTitle:(NSString *)title tabBarImage:(UIImage *)image;


+ (BOOL)autoScaleNavigationBar;
+ (BOOL)autoHidenTabBar;
@end
