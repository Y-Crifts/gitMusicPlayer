//
//  ZYMusicCell.m
//  ZYMusicPlayer
//
//  Created by 王志盼 on 15/10/25.
//  Copyright © 2015年 王志盼. All rights reserved.
//

#import "ZYMusicCell.h"
#import "ZYMusic.h"
#import "ZYImageTool.h"
#import "Colours.h"
static NSString *_identifier = @"ZYMusicCell";
@implementation ZYMusicCell

+ (instancetype)musicCellWithTableView:(UITableView *)tableView
{
    ZYMusicCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifier];
    if (cell == nil) {
        cell = [[ZYMusicCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:_identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:_identifier]) {
        
    }
    return self;
}

- (void)setMusic:(ZYMusic *)music
{
    _music = music;
    self.textLabel.text = music.name;
    self.detailTextLabel.text = music.singer;


    
    _collect = [[UIButton alloc] initWithFrame:CGRectMake(310, 20, 25, 25)];
    _collect.backgroundColor = [UIColor redColor];
    [_collect setTitle:@"收藏" forState:UIControlStateNormal];
    [_collect addTarget:self action:@selector(addPrefer:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_collect];
    
    
    if (music.isPlaying) {
        self.imageView.image = [ZYImageTool circleImageWithName:music.singerIcon borderWidth:2.0 borderColor:[UIColor eggshellColor]];
    }
    else{
        self.imageView.image = [ZYImageTool circleImageWithName:music.singerIcon borderWidth:2.0 borderColor:[UIColor pinkColor]] ;
    }
}

- (void)addPrefer:(UIButton *)btn{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SendCollect" object:[NSString stringWithFormat:@"%ld",(long)btn.tag]];
    

}


@end
