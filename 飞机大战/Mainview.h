//
//  Mainview.h
//  飞机大战
//
//  Created by humanover on 14-11-9.
//  Copyright (c) 2014年 humanover. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mainview : UIView
{
    UIImage *zidanImage;//子弹图片
    UIImage *direnImage;//敌人图片
    UIImage *baozhaImage;//爆炸图片
    UIImage *zhandoujiImage;//战斗机图片
}
@property (strong,nonatomic) NSMutableArray* zidans;//子弹集合
@property (strong,nonatomic) NSMutableArray*direns;//敌人集合
@property (strong,nonatomic) NSMutableArray*baozhas;//炸弹集合
@property (assign,nonatomic) CGPoint ptZdj;//战斗机位置
@end
