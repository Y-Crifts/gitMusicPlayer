//
//  ZYMusicViewController.m
//  ZYMusicPlayer
//
//  Created by 王志盼 on 15/10/13.
//  Copyright © 2015年 王志盼. All rights reserved.
//

#import "ZYMusicViewController.h"
#import "MiddleAddViewController.h"
#import "ZYMusicTool.h"
#import "ZYMusic.h"
#import "ZYMusicCell.h"
#import "Singleton.h"

@interface ZYMusicViewController ()

@property (nonatomic, assign) int currentIndex;
@end

@implementation ZYMusicViewController

- (MiddleAddViewController *)playingVc
{
    
    Singleton * Danli = [[Singleton alloc] init];
    
    return Danli.playingVc;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigation];
}

- (void)setupNavigation
{
    self.navigationItem.title = @"音乐播放器";
}

#pragma mark ----TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [ZYMusicTool musics].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYMusicCell *cell = [ZYMusicCell musicCellWithTableView:tableView];
    cell.music = [ZYMusicTool musics][indexPath.row];
    cell.collect.tag = [indexPath row];
    return cell;
}

#pragma mark ----TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [ZYMusicTool setPlayingMusic:[ZYMusicTool musics][indexPath.row]];
    
    ZYMusic *preMusic = [ZYMusicTool musics][self.currentIndex];
    preMusic.playing = NO;
    ZYMusic *music = [ZYMusicTool musics][indexPath.row];
    music.playing = YES;
    NSArray *indexPaths = @[
                            [NSIndexPath indexPathForItem:self.currentIndex inSection:0],
                            indexPath
                            ];
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    
    self.currentIndex = (int)indexPath.row;
    
    NSString * index = [NSString stringWithFormat:@"%ld",[indexPath row]];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SendValue" object:[NSString stringWithFormat:@"%@",index]];
    
    
    [self.playingVc show];
}

@end
