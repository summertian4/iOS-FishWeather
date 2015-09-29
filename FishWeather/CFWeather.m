//
//  CFWeather.m
//  FishWeather
//
//  Created by 周凌宇 on 15/9/29.
//  Copyright © 2015年 周凌宇. All rights reserved.
//
#import "CFWeather.h"
#import "CFDay.h"

@implementation CFWeather

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.date = [dict valueForKey:@"date"];
        self.currentCity = [[dict valueForKeyPath:@"results.currentCity"] firstObject];
        NSMutableArray *weekDates = [[dict valueForKeyPath:@"results.weather_data.date"] firstObject];
        NSMutableArray *weathers = [[dict valueForKeyPath:@"results.weather_data.weather"] firstObject];
        NSMutableArray *temperatures = [[dict valueForKeyPath:@"results.weather_data.temperature"] firstObject];
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < 4; i++) {
            CFDay *day = [[CFDay alloc] init];
            day.weekDate = weekDates[i];
            day.weather = weathers[i];
            day.temperature = temperatures[i];
            [array addObject:day];
        }
        self.days = array;
    }
    return self;
}

+ (instancetype)weatherWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
