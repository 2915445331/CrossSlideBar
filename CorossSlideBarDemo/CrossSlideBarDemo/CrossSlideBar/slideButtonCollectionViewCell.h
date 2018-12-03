//
//  slideButtonCollectionViewCell.h
//  Cat
//
//  Created by 流年 on 2018/10/11.
//  Copyright © 2018年 霍超越你a s. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface slideButtonCollectionViewCell : UICollectionViewCell
//显示文字
@property(nonatomic,strong)NSString * textTitleString;
//标题字体
@property(nonatomic,assign)UIFont * textLabFont;
//字体颜色 默认黑色
@property(nonatomic,strong)UIColor * textColor;
//底线高度 默认2
@property(nonatomic,assign)CGFloat bottomLinHeight;
//选中底线图片
@property(nonatomic,strong)UIImage * bottomLinImage;
//底线颜色,默认红色
@property(nonatomic,strong)UIColor * bottomLinColor;
//背景色
@property(nonatomic,strong)UIColor * backSeletedColor;
//边框颜色
@property(nonatomic,strong)UIColor * borderColor;
//选中边框宽度
@property(nonatomic,assign)CGFloat  borderWidth;
@end
