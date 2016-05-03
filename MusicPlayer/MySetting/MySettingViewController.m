//
//  MySettingViewController.m
//  MusicPlayer
//
//  Created by 刘言 on 16/5/2.
//  Copyright © 2016年 LY. All rights reserved.
//

#import "MySettingViewController.h"
#import "MyCollectTableViewController.h"


@interface MySettingViewController ()

@end

@implementation MySettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)Collect:(id)sender {
    
    MyCollectTableViewController * collectVC = [[MyCollectTableViewController alloc] init];

   
    
    [self.navigationController pushViewController:collectVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
