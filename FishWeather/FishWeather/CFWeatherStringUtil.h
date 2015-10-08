//
//  CFWeatherStringUtil.h
//  FishWeather
//
//  Created by 周凌宇 on 15/9/29.
//  Copyright © 2015年 周凌宇. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CFWeather;
@interface CFWeatherStringUtil : NSObject

/**
 *  根据温度字符串获取最高温度
 *
 *  @param temperature 温度字符串
 *
 *  @return 最高温度
 */
+ (NSString *)highestTemperature:(NSString *)temperature;
/**
 *  根据温度字符串获取最低温度
 *
 *  @param temperature 温度字符串
 *
 *  @return 最低温度
 */
+ (NSString *)lowestTemperature:(NSString *)temperature;


/**
 *  根据天气对象获取温度大标签的文字
 *
 *  @param weather 天气对象
 *
 *  @return 天气打标签的文字
 */
+ (NSString *)bigTemperature:(CFWeather *)weather;
/**
 *  根据天气对象获取天气大标签的文字
 *
 *  @param weather 天气对象
 *
 *  @return 天气大标签文字
 */
+ (NSString *)bigWeather:(CFWeather *)weather;
/**
 *  根据天气对象获取周几大标签的文字
 *
 *  @param weather 天气对象
 *
 *  @return 周几大标签文字
 */
+ (NSString *)bigWeekDate:(CFWeather *)weather;


/**
 *  根据天气字符串获取当前天气的图标名称
 *
 *  @param weather 天气字符串
 *
 *  @return 图标名称
 */
+ (NSString *)imgName:(NSString *)weather;
/**
 *  根据天气对象获取背景图片名称
 *
 *  @param weather 天气对象
 *
 *  @return 背景图片名称
 */
+ (NSString *)backgroudName:(CFWeather *)weather;
@end
