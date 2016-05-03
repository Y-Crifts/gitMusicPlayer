//
//  AppDelegate.m
//  MusicPlayer
//
//  Created by dc on 16/4/27.
//  Copyright © 2016年 LY. All rights reserved.
//

#import "AppDelegate.h"
#import "LYViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    LYViewController * tabbarVC = [[LYViewController alloc] init];
    self.window.rootViewController = tabbarVC;
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}




@end
