//
//  ViewController.h
//  FishWeather
//
//  Created by 周凌宇 on 15/9/25.
//  Copyright © 2015年 周凌宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, copy) NSString *cityName;
/**
 *  设置界面上所有的数据
 *
 *  @param cityName 当前城市名称
 */
- (void) settingData:(NSString *)cityName;
@end

