//
//  LYViewController.m
//  MusicPlayer
//
//  Created by dc on 16/4/27.
//  Copyright © 2016年 LY. All rights reserved.
//

#import "LYViewController.h"
#import "LYUITabBar.h"
#import "MySettingViewController.h"
//#import "MyMusicTableViewController.h"
#import "MJExtension.h"
#import "MiddleAddViewController.h"
#import "ZYMusicViewController.h"
#import "ZYMusic.h"
#import "ZYMusicTool.h"
#import "Singleton.h"
@interface LYViewController ()<LYUITabBarDelegate>


//@property (nonatomic, strong) MiddleAddViewController *playingVc;
@property (nonatomic, assign) int index;
@property (nonatomic, assign) int last;

@end

@implementation LYViewController

- (MiddleAddViewController *)playingVc
{
    Singleton * Danli = [[Singleton alloc] init];
    
    return Danli.playingVc;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray * count = [ZYMusic objectArrayWithFilename:@"Musics.plist"];
    _last = (int)count.count - 1;
    //    更换系统自带的tabbar
    
    LYUITabBar * tabBar = [[LYUITabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
    
    //    UITabBarController里边有一个只读的属性tabBar
    //    我们可以用kvc来个这个属性赋值，这样就能自定义我们的tabbar了

    
    ZYMusicViewController * musicVC = [[ZYMusicViewController alloc] init];
    
    musicVC.title = @"我的音乐";
    UINavigationController * musicNC = [[UINavigationController alloc] initWithRootViewController:musicVC];
    
    MySettingViewController * settingVC = [[MySettingViewController alloc] init];
    
    settingVC.title = @"我的设置";
    UINavigationController * settingNC = [[UINavigationController alloc] initWithRootViewController:settingVC];
    
    [self addChildViewController:musicNC];
    [self addChildViewController:settingNC];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resiveNotifaction:) name:@"SendValue" object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resiveIndexAddNotifaction:) name:@"SendAddIndex" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resiveIndexReducdNotifaction:) name:@"SendReduceIndex" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resiveNotifactions:) name:@"SendCollect" object:nil];
}

- (void)resiveNotifactions:(NSNotification *)nof{
    
    
    if ([_delegateO respondsToSelector:@selector(sendValue:)]) {
        
        [_delegateO sendValue:(int)[nof.object integerValue]];

        
    }
    
    
}



#pragma mark LYUITabBarDelegate

- (void)TabBarDidClickPlusButton:(LYUITabBar *)tabBar{

    [ZYMusicTool setPlayingMusic:[ZYMusicTool musics][self.index]];
    
    ZYMusic *preMusic = [ZYMusicTool musics][self.index];
    preMusic.playing = NO;
    ZYMusic *music = [ZYMusicTool musics][self.index];
    music.playing = YES;

    [self.playingVc show];

    
}


- (void)resiveIndexAddNotifaction:(NSNotification *)nof{
    if (self.index == _last) {
        self.index = 0;
    }else{
    self.index ++;

    }
}

- (void)resiveIndexReducdNotifaction:(NSNotification *)nof{
    
    if (self.index != 0) {
        
        self.index --;
    }else{
        self.index = _last;
    }
    
}

- (void)resiveNotifaction:(NSNotification *)nof{
    
    NSString * index = nof.object;
    
    self.index = [index intValue];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
