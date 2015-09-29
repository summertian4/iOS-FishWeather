//
//  CFDay.h
//  FishWeather
//
//  Created by 周凌宇 on 15/9/29.
//  Copyright © 2015年 周凌宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFDay : NSObject
// 周几
@property (nonatomic, copy) NSString *weekDate;
// 天气描述
@property (nonatomic, copy) NSString *weather;
// 温度
@property (nonatomic, copy) NSString *temperature;
@end
