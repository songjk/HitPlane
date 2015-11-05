//
//  Mainview.m
//  飞机大战
//
//  Created by humanover on 14-11-9.
//  Copyright (c) 2014年 humanover. All rights reserved.
//

#import "Mainview.h"
#import "SJKSprite.h"

@implementation Mainview

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor grayColor];
        zidanImage=[UIImage imageNamed:@"zd.png"];
        direnImage=[UIImage imageNamed:@"dr.png"];
        baozhaImage=[UIImage imageNamed:@"bz.png"];
        self.zidans=[[NSMutableArray alloc]initWithCapacity:100];
        self.direns=[[NSMutableArray alloc]initWithCapacity:100];
        self.baozhas=[[NSMutableArray alloc]initWithCapacity:100];
        //战斗机显示位置
        zhandoujiImage=[UIImage imageNamed:@"nc.png"];
        self.ptZdj=CGPointMake(360/2-62/2, 480-20-74);
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //[zidanImage drawAtPoint:CGPointMake(100, 100)];
    //战斗机绘制
    [zhandoujiImage drawAtPoint:self.ptZdj];
    //统计有多少个子弹要移除
    NSMutableArray *arr=[[NSMutableArray alloc]initWithCapacity:100];
    for (SJKSprite* s in self.zidans)
    {
        //如果子弹无效就放入到要移除的集合
        if (s.isUsed==NO)
        {
            [arr addObject:s];
        }
    }
    //移除掉无效子弹
    [self.zidans removeObjectsInArray:arr];
    //绘制子弹
    //遍历子弹集合
    for (SJKSprite* s in self.zidans)
    {
        [zidanImage drawAtPoint:CGPointMake(s.x, s.y)];
        
    }
    
    //绘制敌人
    
    //统计有多敌人要移除
    [arr removeAllObjects];
    for (SJKSprite* s in self.direns)
    {
        //如果子弹无效就放入到要移除的集合
        if (s.isUsed==NO)
        {
            [arr addObject:s];
        }
    }
    //移除掉无效敌人
    [self.direns removeObjectsInArray:arr];
    //便利敌人集合
    for (SJKSprite* s in self.direns)
    {
        [direnImage drawAtPoint:CGPointMake(s.x, s.y)];
        
    }
    
    //统计有多炸弹要移除
    [arr removeAllObjects];
    for (SJKSprite* baoz in self.baozhas)
    {
        //如果炸弹无效就放入到要移除的集合
        if (baoz.isUsed==NO)
        {
            [arr addObject:baoz];
        }
    }
    //移除掉无效炸弹
    [self.baozhas removeObjectsInArray:arr];
    //便利炸弹集合
    for (SJKSprite* bz in self.baozhas)
    {
        [baozhaImage drawAtPoint:CGPointMake(bz.x, bz.y)];
        bz.isUsed=NO;
        
    }
    NSLog(@"子弹总数为：%d,敌人的总数为：%d",[self.zidans count],[self.direns count]);
}


@end
