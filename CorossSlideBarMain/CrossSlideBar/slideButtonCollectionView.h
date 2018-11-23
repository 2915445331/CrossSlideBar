//
//  slideButtonCollectionView.h
//  Cat
//
//  Created by 流年 on 2018/10/11.
//  Copyright © 2018年 霍超越你a s. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface slideButtonCollectionView : UICollectionView
//返回点击
@property(nonatomic,copy)void (^ClickTitleReturn) (NSString * titleIndex);
//手动设置选中
@property(nonatomic,assign)NSInteger cellIndexPath;
//滚动方向(横向、竖向 填写其他默认横向)
@property(nonatomic,strong)NSString * rollingDirection;
//标题数组
@property(nonatomic,strong)NSArray * titleArr;
//标题字体 默认14
@property(nonatomic,strong)UIFont * textLabFont;
//字体颜色 默认黑色
@property(nonatomic,strong)UIColor * textColor;
//选中字体颜色 默认黑色
@property(nonatomic,strong)UIColor * textSeltedColor;
//未选中背景色
@property(nonatomic,strong)UIColor * backColor;
//选中背景色
@property(nonatomic,strong)UIColor * backSeletedColor;
//选中标题字体 默认16
@property(nonatomic,strong)UIFont * textSeletedLabFont;
//底线高度 默认2
@property(nonatomic,assign)CGFloat bottomLinHeight;
/*图片颜色二选一 如若两者都设置默认用图片显示*/
//底线图片
@property(nonatomic,strong)UIImage * bottomLinImage;
//选中底线图片
@property(nonatomic,strong)UIImage * bottomSeletdLinImage;
//底线颜色,默认无
@property(nonatomic,strong)UIColor * bottomLinColor;
//选中底线颜色,默认红色
@property(nonatomic,strong)UIColor * bottomLinSeltedColor;
@end
