//
//  LYUITabBar.h
//  MusicPlayer
//
//  Created by dc on 16/4/27.
//  Copyright © 2016年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LYUITabBar;
@protocol LYUITabBarDelegate <UITabBarDelegate>

- (void)TabBarDidClickPlusButton:(LYUITabBar *)tabBar;

@end




@interface LYUITabBar : UITabBar

@property(nonatomic, weak) id<LYUITabBarDelegate> delegate;


@end
