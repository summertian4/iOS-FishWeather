//
//  ViewController.m
//  FishWeather
//
//  Created by 周凌宇 on 15/9/25.
//  Copyright © 2015年 周凌宇. All rights reserved.
//

#import "ViewController.h"
#import "CFWeatherAchieve.h"
#import "CFWeather.h"
#import "CFDay.h"
#import "CFWeatherStringUtil.h"

@interface ViewController ()
// 温度大标签
@property (weak, nonatomic) IBOutlet UILabel *lblBigTemp;
// 天气大标签
@property (weak, nonatomic) IBOutlet UILabel *lblBigWeather;
// 周几大标签
@property (weak, nonatomic) IBOutlet UILabel *lblBigWeekDate;
// 当前城市标签
@property (weak, nonatomic) IBOutlet UILabel *lblCurrentCity;

// 第一天最高气温
@property (weak, nonatomic) IBOutlet UILabel *lblFirstDayHT;
// 第一天最低气温
@property (weak, nonatomic) IBOutlet UILabel *lblFirstDayLT;
// 第二天最高气温
@property (weak, nonatomic) IBOutlet UILabel *lblSecondDayHT;
// 第二天最低气温
@property (weak, nonatomic) IBOutlet UILabel *lblSecondDayLT;
// 第三天最高气温
@property (weak, nonatomic) IBOutlet UILabel *lblThirdDayHT;
// 第三天最低气温
@property (weak, nonatomic) IBOutlet UILabel *lblThirdDayLT;
// 第四天最高气温
@property (weak, nonatomic) IBOutlet UILabel *lblFourthDayHT;
// 第四天最低气温
@property (weak, nonatomic) IBOutlet UILabel *lblFourthDayLT;

// 第三天 周几标签
@property (weak, nonatomic) IBOutlet UILabel *lblThirdDayDate;
// 第四天 周几标签
@property (weak, nonatomic) IBOutlet UILabel *lblFourthDayDate;

// 第一天天气图片
@property (weak, nonatomic) IBOutlet UIImageView *imgFirstDayWeather;
// 第二天天气图片
@property (weak, nonatomic) IBOutlet UIImageView *imgSecondDayWeather;
// 第三天天气图片
@property (weak, nonatomic) IBOutlet UIImageView *imgThirdDayWeather;
// 第四天天气图片
@property (weak, nonatomic) IBOutlet UIImageView *imgFourthDayWeather;


// 最高气温数组
@property (nonatomic, strong) NSMutableArray *lblHTArray;
// 最低气温数组
@property (nonatomic, strong) NSMutableArray *lblLTArray;
// 天气图片数组
@property (nonatomic, strong) NSMutableArray *imgWeatherArray;

@end

@implementation ViewController

#pragma mark - ================viewDidLoad================
- (void)viewDidLoad {
    [super viewDidLoad];
    [self packView];
    [self settingData:@"上海"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - ================封装方法================
/**
 *  设置界面上所有的数据
 *
 *  @param cityName 当前城市名称
 */
- (void) settingData:(NSString *)cityName {
    // 1.获取模型
    CFWeather *weather = [CFWeatherAchieve weatherWithCity:cityName];
    // 2.设置数据
    self.lblBigTemp.text = [CFWeatherStringUtil bigTemperature:weather];
    self.lblBigWeather.text = [CFWeatherStringUtil bigWeather:weather];
    self.lblBigWeekDate.text = [CFWeatherStringUtil bigWeekDate:weather];;
    self.lblCurrentCity.text = weather.currentCity;
    
    self.lblThirdDayDate.text = [weather.days[2] weekDate];
    self.lblFourthDayDate.text = [weather.days[3] weekDate];
    
    for (int i = 0; i < 4; i++) {
        NSString *temperature = [weather.days[i] temperature];
        [self.lblHTArray[i] setText:[CFWeatherStringUtil highestTemperature:temperature]];
        [self.lblLTArray[i] setText:[CFWeatherStringUtil lowestTemperature:temperature]];
        NSString *imgName = [CFWeatherStringUtil imgName:[weather.days[i] weather]];
        [self.imgWeatherArray[i] setImage:[UIImage imageNamed:imgName]];
    }
}

/**
 *  把每一天的控件分别打包到数组中
 */
- (void)packView {
    self.lblHTArray = [NSMutableArray array];
    self.lblLTArray = [NSMutableArray array];
    self.imgWeatherArray = [NSMutableArray array];
    
    [self.lblHTArray addObject:self.lblFirstDayHT];
    [self.lblHTArray addObject:self.lblSecondDayHT];
    [self.lblHTArray addObject:self.lblThirdDayHT];
    [self.lblHTArray addObject:self.lblFourthDayHT];
    
    [self.lblLTArray addObject:self.lblFirstDayLT];
    [self.lblLTArray addObject:self.lblSecondDayLT];
    [self.lblLTArray addObject:self.lblThirdDayLT];
    [self.lblLTArray addObject:self.lblFourthDayLT];
    
    [self.imgWeatherArray addObject:self.imgFirstDayWeather];
    [self.imgWeatherArray addObject:self.imgSecondDayWeather];
    [self.imgWeatherArray addObject:self.imgThirdDayWeather];
    [self.imgWeatherArray addObject:self.imgFourthDayWeather];
}
@end
