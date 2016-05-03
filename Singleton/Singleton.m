//
//  Singleton.m
//  MusicPlayer
//
//  Created by 刘言 on 16/5/1.
//  Copyright © 2016年 LY. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton


- (MiddleAddViewController *)playingVc
{
    
    static MiddleAddViewController * _playingVc = nil;
    if (_playingVc == nil) {
        _playingVc = [[MiddleAddViewController alloc] initWithNibName:@"ZYPlayingViewController" bundle:nil];
    }
    return _playingVc;
}


@end
