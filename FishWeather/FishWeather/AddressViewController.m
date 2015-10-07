//
//  AddressViewController.m
//  FishWeather
//
//  Created by 周凌宇 on 15/10/7.
//  Copyright © 2015年 周凌宇. All rights reserved.
//

#import "AddressViewController.h"
#import "ViewController.h"

typedef enum {
    // 省
    kDisplayProvince = 0,
    // 市
    kDisplayCity = 1,
} CFDisplayType;


@interface AddressViewController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
//当前选中的NSIndexPath
@property(nonatomic,strong)NSIndexPath *selectedIndexPath;
@property(nonatomic,assign)int displayType;
@property(nonatomic,strong)NSArray *provinces;
@property(nonatomic,strong)NSArray *citys;
@property(nonatomic,strong)NSString *selectedProvince;//选中的省
@property(nonatomic,strong)NSString *selectedCity;//选中的市

@end

@implementation AddressViewController

#pragma mark - ======================viewDidLoad======================
-(void)viewDidLoad{
    [self settingData];
    [self settingViews];
    
}

#pragma mark - ======================设置数据======================
/**
 *  从plist中获取数据
 */
-(void)settingData{
    if (self.displayType == kDisplayProvince) {
        //从文件读取地址字典
        NSString *addressPath = [[NSBundle mainBundle] pathForResource:@"address" ofType:@"plist"];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithContentsOfFile:addressPath];
        self.provinces = [dict objectForKey:@"address"];
    }
}

/**
 *  设置界面
 */
-(void)settingViews{
    if (self.displayType == kDisplayProvince) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    }
    CGRect frame = [self.view bounds];
    self.tableView = [[UITableView alloc]initWithFrame:frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - ======================tableView代理======================
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.displayType == kDisplayProvince) {
        return self.provinces.count;
    }else {
        return self.citys.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* ID = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        if (self.displayType == kDisplayCity) {
            cell.accessoryType = UITableViewCellAccessoryNone;
        } else{
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    if (self.displayType == kDisplayProvince) {
        NSDictionary *province = self.provinces[indexPath.row];
        NSString *provinceName = [province objectForKey:@"name"];
        cell.textLabel.text= provinceName;
    } else if (self.displayType == kDisplayCity){
        NSDictionary *city = self.citys[indexPath.row];
        NSString *cityName = [city objectForKey:@"name"];
        cell.textLabel.text= cityName;
    }
    return cell;
}

/**
 *  行选择
 *
 *  @param tableView
 *  @param indexPath 
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.displayType == kDisplayProvince) {
        NSDictionary *province = self.provinces[indexPath.row];
        NSArray *citys = [province objectForKey:@"sub"];
        self.selectedProvince = [province objectForKey:@"name"];
        //构建下一级视图控制器
        AddressViewController *cityVC = [[AddressViewController alloc]init];
        cityVC.weatherController = self.weatherController;
        cityVC.displayType = kDisplayCity;//显示模式为城市
        cityVC.citys = citys;
        cityVC.selectedProvince = self.selectedProvince;
        [self.navigationController pushViewController:cityVC animated:YES];
    }else if (self.displayType == kDisplayCity){
        NSDictionary *city = self.citys[indexPath.row];
        NSString *cityName = [city objectForKey:@"name"];
        self.selectedCity = cityName;
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        ViewController *weatherViewController = [story instantiateViewControllerWithIdentifier:@"weatherViewController"];
        [self presentViewController:weatherViewController animated:YES completion:nil];
        [weatherViewController settingData:self.selectedCity];
    }
    
}

#pragma mark - ======================方法封装======================
/**
 * 取消事件
 */
-(void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
