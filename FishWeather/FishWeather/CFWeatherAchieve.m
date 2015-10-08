//
//  CFWeatherAchieve.m
//  FishWeather
//
//  Created by 周凌宇 on 15/9/29.
//  Copyright © 2015年 周凌宇. All rights reserved.
//

#import "CFWeatherAchieve.h"
#import "CFWeather.h"

@implementation CFWeatherAchieve
+ (CFWeather *)weatherWithCity:(NSString *)cityName {
    
    NSString *urlStr = [NSString stringWithFormat:@"http://api.map.baidu.com/telematics/v3/weather?location=%@&output=json&ak=80NAe6wKRazDiIKZZG8XsFQ2", cityName];
    urlStr= [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:urlStr];
    // 2.创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //创建服务器响应信息对象
    NSURLResponse *response = nil;
    //创建错误信息对象
    NSError *error = nil;
    // 3.向服务器发送请求
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response  error:&error];
    // 由于该网址请求下来的数据是字典,所以要用字典接收, 如果是数组,用数组接收, 字典或数组就是你要用的数据
    
    NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

    CFWeather *weatherModel = [CFWeather weatherWithDict:dict];
    
    return weatherModel;
}
@end
