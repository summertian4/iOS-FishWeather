//
//  CFWeatherStringUtil.m
//  FishWeather
//
//  Created by 周凌宇 on 15/9/29.
//  Copyright © 2015年 周凌宇. All rights reserved.
//

#import "CFWeatherStringUtil.h"
#import "CFWeather.h"
#import "CFDay.h"

@implementation CFWeatherStringUtil

+ (NSString *)highestTemperature:(NSString *)temperature {
    NSString *ht = [temperature componentsSeparatedByString:@"~"][0];
    ht = [NSString stringWithFormat:@"%@℃",ht];
    return ht;
}

+ (NSString *)lowestTemperature:(NSString *)temperature {
    NSString *lt = [temperature componentsSeparatedByString:@"~"][1];
    lt = [lt substringFromIndex:1];
    return lt;
}

+ (NSString *)bigTemperature:(CFWeather *)weather {
    NSString *weekDate = [weather.days[0] weekDate];
    NSString *str = [weekDate substringToIndex:weekDate.length - 1];
    return [str componentsSeparatedByString:@"："][1];
}

+ (NSString *)bigWeather:(CFWeather *)weather {
    return [weather.days[0] weather];
}

+ (NSString *)backgroudName:(CFWeather *)weather {
    NSString *weatherName = [self bigWeather:weather];
    weatherName = [weatherName componentsSeparatedByString:@"转"][0];
    if ([weatherName containsString:@"晴"]) {
        return @"qingtian";
    } else if ([weatherName containsString:@"阴"]) {
        return @"yintian";
    } else if ([weatherName containsString:@"雪"]) {
        return @"xuetian";
    } else if ([weatherName containsString:@"雨"]) {
        return @"yutian";
    }
    return @"qingtian";
}


+ (NSString *)bigWeekDate:(CFWeather *)weather {
    return [[weather.days[0] weekDate] substringToIndex:2];
}

+ (NSString *)imgName:(NSString *)weather {
    NSString *imgName = weather;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"weather" ofType:@"plist"];
    NSDictionary *imgDic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    imgName = [imgName componentsSeparatedByString:@"转"][0];
    imgName = [imgDic valueForKey:imgName];
    return imgName;
}

@end
