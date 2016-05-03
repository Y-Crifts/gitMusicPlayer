//
//  LYViewController.h
//  MusicPlayer
//
//  Created by dc on 16/4/27.
//  Copyright © 2016年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol sendValueDelegate <UITabBarDelegate>

- (void)sendValue:(int)index;

@end

@interface LYViewController : UITabBarController

@property(nonatomic, weak)id<sendValueDelegate>delegateO;


@end
