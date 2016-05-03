//
//  LYUITabBar.m
//  MusicPlayer
//
//  Created by dc on 16/4/27.
//  Copyright © 2016年 LY. All rights reserved.
//

#import "LYUITabBar.h"

@interface LYUITabBar()

@property(nonatomic, weak) UIButton * plusBtn;

@end



@implementation LYUITabBar


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        //添加中间的按钮
        UIButton * plusBtn = [[UIButton alloc] init];
        
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
  
        CGRect a = plusBtn.frame;
        a.size = plusBtn.currentBackgroundImage.size;
        plusBtn.frame = a;
        
        
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:plusBtn];
        self.plusBtn = plusBtn;
        
    }
    
    return self;
}

//按钮对应的点击事件
- (void)plusClick{
    
    if ([self.delegate respondsToSelector:@selector(TabBarDidClickPlusButton:)]) {
        
        [self.delegate TabBarDidClickPlusButton:self];
    }
}


//重写tabbar的layout方法
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGPoint b = self.plusBtn.center;
    b.x = self.frame.size.width * 0.5;
    b.y = self.frame.size.height * 0.5;
    self.plusBtn.center = b;
    
    
    CGFloat tabbarButtonW = self.frame.size.width/3;
    int tabBarButtonIndex = 0;
    
    
    
    //    把tabbar平分为五份
    //    找出tabbar上的所有的子控件
    for (UIView * child in self.subviews) {
        //       因为UITabBarButton类是系统内部的类，不允许访问
        //       所以我们用NSClassFromString 来用字符串定义一个UITabBarButton 的类
        Class class = NSClassFromString(@"UITabBarButton");
        
        //在找出所有子控件是UITabBarButton类型的控件
        if ([child isKindOfClass:class]) {
            
            CGRect c = child.frame;
            c.size.width = tabbarButtonW;
            c.origin.x = tabbarButtonW * tabBarButtonIndex;
            child.frame = c;
            
            tabBarButtonIndex ++;
            
            if (tabBarButtonIndex == 1) {
                
                tabBarButtonIndex++;
            }
            
            
        }
        
    }

    
    
}


@end
























