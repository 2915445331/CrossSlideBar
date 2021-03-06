//
//  ViewController.m
//  CrossSlideBarDemo
//
//  Created by 流年 on 2018/10/19.
//  Copyright © 2018年 流年. All rights reserved.
//

#import "ViewController.h"
#import "slideButtonCollectionView.h"
@interface ViewController ()
//滑动标题
@property(nonatomic,strong)slideButtonCollectionView * slideButtonV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.slideButtonV];
}
//#pragma mark - 滑动标题
//-(slideButtonCollectionView *)slideButtonV{
//    if (!_slideButtonV) {
//        _slideButtonV = [[slideButtonCollectionView alloc]initWithFrame:CGRectMake(0, 100, 100, 300)];
//        _slideButtonV.titleArr = @[@"牙尚",@"童话",@"孕记",@"牙圈",@"人物",@"专题"];
//        _slideButtonV.rollingDirection = @"竖向";
////        _slideButtonV.cellHeight = @"100";
//        _slideButtonV.textColor = [UIColor blackColor];
//        _slideButtonV.textSeltedColor = [UIColor whiteColor];
//        _slideButtonV.bottomLinSeltedColor = [UIColor redColor];
//        _slideButtonV.backSeletedColor = [UIColor redColor];
//        _slideButtonV.ClickTitleReturn = ^(NSString *titleIndex) {
//            NSLog(@"%@",titleIndex);
//        };
//    }
//    return _slideButtonV;
//}
#pragma mark - 滑动标题
-(slideButtonCollectionView *)slideButtonV{
    if (!_slideButtonV) {
        _slideButtonV = [[slideButtonCollectionView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 30)];
        _slideButtonV.titleArr = @[@"牙尚",@"童话",@"孕记",@"牙圈",@"人物",@"专题",@"牙尚",@"童话",@"孕记",@"牙圈",@"人物",@"专题",@"牙尚",@"童话",@"孕记",@"牙圈",@"人物",@"专题"];
        _slideButtonV.bottomLinHeight = 2;
        _slideButtonV.bottomLinWeight = 10;
//        _slideButtonV.borderWidth = 0;
        _slideButtonV.borderSeletedColor = [UIColor blueColor];
//        _slideButtonV.cellWeight = @"100";
        _slideButtonV.textColor = [UIColor orangeColor];
        _slideButtonV.textSeltedColor = [UIColor purpleColor];
//        _slideButtonV.bottomLinSeltedColor = [UIColor redColor];
        _slideButtonV.backSeletedColor = [UIColor yellowColor];
        _slideButtonV.ClickTitleReturn = ^(NSString *titleIndex) {
            NSLog(@"%@",titleIndex);
        };
    }
    return _slideButtonV;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    _slideButtonV.cellIndexPath ++;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
