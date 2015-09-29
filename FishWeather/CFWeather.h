//
//  CFWeather.h
//  FishWeather
//
//  Created by 周凌宇 on 15/9/29.
//  Copyright © 2015年 周凌宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFWeather : NSObject
// 日期
@property (nonatomic, copy) NSString *date;
// 当前城市
@property (nonatomic, copy) NSString *currentCity;
// 每一天天气集合
@property (nonatomic, strong) NSArray *days;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)weatherWithDict:(NSDictionary *)dict;

@end
