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
//设置标题宽度 默认 @"0"（仅限横向，竖向默认控件宽度且无法更改,注意如若设置过cellWeight将改变所有标题同一宽度）如若不设置将自动计算 titleArr 宽度
@property(nonatomic,strong)NSString * cellWeight;
//设置标题宽度 默认 @"0"（仅限竖向，横向默认控件高度且无法更改,注意如若设置过cellHeight 将改变所有标题同一高度）如若不设置将自动计算 titleArr 高度
@property(nonatomic,strong)NSString * cellHeight;
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
//底线高度 默认2 注意设置边框则不能设置底线否则底线将会不显示
@property(nonatomic,assign)CGFloat bottomLinHeight;
//选中边框颜色默认透明
@property(nonatomic,strong)UIColor * borderSeletedColor;
//未选中边框颜色默认透明
@property(nonatomic,strong)UIColor * borderColor;
//选中边框宽度 默认0 注意设置边框则不能设置底线否则底线将会不显示
@property(nonatomic,assign)CGFloat  borderWidth;
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
