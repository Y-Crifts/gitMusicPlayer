//
//  MyCollectTableViewController.m
//  MusicPlayer
//
//  Created by 刘言 on 16/5/2.
//  Copyright © 2016年 LY. All rights reserved.
//

#import "MyCollectTableViewController.h"
#import "MiddleAddViewController.h"
#import "ZYMusicTool.h"
#import "ZYMusic.h"
#import "ZYMusicCell.h"
#import "Singleton.h"
#import "LYViewController.h"


@interface MyCollectTableViewController ()<sendValueDelegate>
@property (nonatomic, assign) int currentIndex;
@property (nonatomic, assign) int collectIndex;
@property (nonatomic, strong) NSMutableArray * collectArray;

@end

@implementation MyCollectTableViewController

- (MiddleAddViewController *)playingVc
{
    
    Singleton * Danli = [[Singleton alloc] init];
    
    return Danli.playingVc;
    
}

- (NSMutableArray *)lazy{
    if (_collectArray == nil) {
        _collectArray = [[NSMutableArray alloc] init];
    }
    
    return _collectArray;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"收藏";
    [self.navigationItem.leftBarButtonItem setTitle:@"返回"];
    

    

}

- (void)sendValue:(int)index{
  
    
    [self lazy];
    _collectIndex = index;
    [_collectArray addObject:[NSString stringWithFormat:@"%d",index]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ----TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _collectArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYMusicCell *cell = [ZYMusicCell musicCellWithTableView:tableView];
    cell.music = [ZYMusicTool musics][_collectIndex];
    cell.collect.tag = _collectIndex;
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
