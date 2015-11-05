//
//  MainViewController.m
//  飞机大战
//
//  Created by humanover on 14-11-9.
//  Copyright (c) 2014年 humanover. All rights reserved.
//

#import "MainViewController.h"
#import "SJKSprite.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    drawViw=[[Mainview alloc]init];
    self.view=drawViw;
    //创建定时器
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(onTimer:) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view.
}
//定时器想要
-(void)onTimer:(NSTimer*)sender
{
    //调整每个子弹的坐标
    //便利子弹对象
    for (SJKSprite *s in drawViw.zidans)
    {
        //坐标向上
        s.y-=5;
        //判读子弹坐标是不是超出了屏幕
        if (s.y<0)
        {
            //设定这个子弹为无效
            s.isUsed=NO;
        }
    }
    
    //产生敌人
    
    //调整每个敌人的坐标
    //便利敌人对象
    for (SJKSprite *s in drawViw.direns)
    {
        //坐标向下
        s.y+=5;
        //判读敌人坐标是不是超出了屏幕
        if (s.y>480)
        {
            //设定这个子弹为无效
            s.isUsed=NO;
        }
    }
    //随机生产敌人位置
    
    static int c=0;
    c++;
    NSLog(@"c======%d",c);
    if (c%5==0) {
        int dx=arc4random()%310;
        SJKSprite *dr=[[SJKSprite alloc]init];
        dr.x=dx;
        dr.y=-10;
        dr.isUsed=YES;
        //把当前对象放到敌人集合中
        [drawViw.direns addObject:dr];
        c=0;
    }

    //碰撞检测 检查子弹和敌人是否相交
    
    //遍历每个子弹
    for (SJKSprite *zd in drawViw.zidans)
    {
        //得到当前子弹的矩形
        CGRect zdRect=CGRectMake(zd.x, zd.y, 16, 16);
        //便利敌人对象
        for (SJKSprite *dr in drawViw.direns)
        {
            CGRect drRect=CGRectMake(dr.x, dr.y, 39, 34);
            //判断子弹和敌人的矩形是否有交集
            if(CGRectIntersectsRect(zdRect, drRect))
            {
                zd.isUsed=NO;
                dr.isUsed=NO;
                
                //产生一个爆炸对象
                SJKSprite *bz=[[SJKSprite alloc]init];
                bz.x=dr.x;
                bz.y=dr.y;
                bz.isUsed=YES;
                //把当前对象放到炸弹集合中
                [drawViw.baozhas addObject:bz];
            }
        }
    }
    //重新回执视图
    [self.view setNeedsDisplay];
    
}
//触摸事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //获得触摸对象
    UITouch *touch=[touches anyObject];
    //获得触摸点的坐标
    CGPoint p=  [touch locationInView:self.view];
    //改变战斗机的位置
    drawViw.ptZdj=p;
    
    //如果点击位置坐标大于400
    if (p.y>400) {
        //构建子弹对象
        SJKSprite *zd=[[SJKSprite alloc]init];
        zd.x=p.x+62/2-5;
        zd.y=p.y;
        zd.isUsed=YES;
        //把当前对象放到子弹集合中
        [drawViw.zidans addObject:zd];
        //重新回执视图
        [self.view setNeedsDisplay];
    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
