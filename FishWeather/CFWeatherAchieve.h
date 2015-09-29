//
//  CFWeatherAchieve.h
//  FishWeather
//
//  Created by 周凌宇 on 15/9/29.
//  Copyright © 2015年 周凌宇. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CFWeather;
@interface CFWeatherAchieve : NSObject
+ (CFWeather *)weatherWithCity:(NSString *)cityName;
@end
