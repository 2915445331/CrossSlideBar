//
//  slideButtonCollectionView.m
//  Cat
//
//  Created by 流年 on 2018/10/11.
//  Copyright © 2018年 霍超越你a s. All rights reserved.
//

#import "slideButtonCollectionView.h"
#import "slideButtonCollectionViewCell.h"
#import "slideButtonFooterView.h"
@interface slideButtonCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>
//布局流
@property(nonatomic,strong)UICollectionViewFlowLayout * flow;
//网格宽度
@property(nonatomic,assign)CGFloat cellWeight;
@end
@implementation slideButtonCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:self.flow]) {
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
        self.dataSource = self;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        // 为网格注册单于格类
        [self registerClass:[slideButtonCollectionViewCell class] forCellWithReuseIdentifier:@"slideButtonCollectionViewCell"];

        //        注册页尾
        [self registerClass:[slideButtonFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"slideButtonFooterView"];
        self.cellWeight = 60;
        self.bottomLinColor = [UIColor redColor];
        self.textLabFont = [UIFont systemFontOfSize:14];
        self.textSeletedLabFont = [UIFont systemFontOfSize:16];
        self.textSeltedColor = [UIColor blackColor];
        self.bottomLinHeight = 2;
        self.bottomLinSeltedColor = [UIColor redColor];
        self.bottomLinColor = [UIColor clearColor];
        self.textColor = [UIColor blackColor];
        self.bottomLinImage = [UIImage imageNamed:@""];
    }
    return self;
}
-(UICollectionViewFlowLayout *)flow{
    if (!_flow) {
        //创建流布局对象
        _flow = [[UICollectionViewFlowLayout alloc]init];
        //设置滚动方向
        _flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _flow;
}
#pragma mark - 网格分区个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
#pragma mark - 网格单元格个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.titleArr.count;
}
#pragma mark - 单元格大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([_rollingDirection isEqualToString:@"横向"]) {
        return CGSizeMake(self.cellWeight, self.frame.size.height);
    }
    if ([_rollingDirection isEqualToString:@"竖向"]) {
        return CGSizeMake(self.frame.size.width, 40);
    }
    return CGSizeMake(self.cellWeight, self.frame.size.height);
}
#pragma mark - 上下左右间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 0, 5);//分别为上、左、下、右
}
#pragma mark - 返回单元格
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    slideButtonCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"slideButtonCollectionViewCell" forIndexPath:indexPath];
    cell.textTitleString = self.titleArr[indexPath.row];
    cell.bottomLinHeight = self.bottomLinHeight;
    if (self.cellIndexPath == indexPath.row) {
        cell.textLabFont = self.textSeletedLabFont;
        cell.textColor = self.textSeltedColor;
        if (self.bottomSeletdLinImage) {
            cell.bottomLinColor = [UIColor clearColor];
        }
        else{
            cell.bottomLinColor = self.bottomLinSeltedColor;
        }
        cell.bottomLinImage = self.bottomSeletdLinImage;
        cell.backSeletedColor = self.backSeletedColor;
    }
    else{
        cell.textLabFont = self.textLabFont;
        cell.textColor = self.textColor;
        cell.bottomLinImage = self.bottomLinImage;
        cell.bottomLinColor = self.bottomLinColor;
        cell.backSeletedColor = self.backColor;
    }
    return cell;
}
#pragma mark - 点击单元格
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.cellIndexPath = indexPath.row;
    [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
    self.ClickTitleReturn(self.titleArr[indexPath.row]);
    [self reloadData];
}
#pragma mark - 标题文字
-(void)setTitleArr:(NSArray *)titleArr{
    _titleArr = titleArr;
    [self reloadData];
}
#pragma mark - 底线高度
-(void)setBottomLinHeight:(CGFloat)bottomLinHeight{
    _bottomLinHeight = bottomLinHeight;
    if (_bottomLinHeight) {
        [self reloadData];
    }
}
#pragma mark - 选中底线图片
-(void)setBottomLinImage:(UIImage *)bottomLinImage{
    _bottomLinImage = bottomLinImage;
    if (_bottomLinImage) {
        [self reloadData];
    }
}
#pragma mark - 标题字体
-(void)setTextLabFont:(UIFont *)textLabFont{
    _textLabFont = textLabFont;
    if (_textLabFont) {
        [self reloadData];
    }
}
#pragma mark - 选中标题字体
-(void)setTextSeletedLabFont:(UIFont *)textSeletedLabFont{
    _textSeletedLabFont = textSeletedLabFont;
    if (_textSeletedLabFont) {
        [self reloadData];
    }
}
#pragma mark - 字体颜色 默认黑色
-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    if (_textColor) {
        [self reloadData];
    }
}
#pragma mark - 选中字体颜色 默认黑色
-(void)setTextSeltedColor:(UIColor *)textSeltedColor{
    _textSeltedColor = textSeltedColor;
    if (_textSeltedColor) {
        [self reloadData];
    }
}
#pragma mark - 选中文字底线颜色
-(void)setBottomLinColor:(UIColor *)bottomLinColor{
    _bottomLinColor = bottomLinColor;
    if (_bottomLinColor) {
        [self reloadData];
    }
}
#pragma mark - 选中底线颜色,默认红色
-(void)setBottomLinSeltedColor:(UIColor *)bottomLinSeltedColor{
    _bottomLinSeltedColor = bottomLinSeltedColor;
    if (_bottomLinSeltedColor) {
        [self reloadData];
    }
}
#pragma mark - 选中底线图片
-(void)setBottomSeletdLinImage:(UIImage *)bottomSeletdLinImage{
    _bottomSeletdLinImage = bottomSeletdLinImage;
    if (_bottomSeletdLinImage) {
        [self reloadData];
    }
}
#pragma mark - 未选中背景色
-(void)setBackColor:(UIColor *)backColor{
    _backColor = backColor;
    if (_backColor) {
        [self reloadData];
    }
}
#pragma mark - 选中背景色
-(void)setBackSeletedColor:(UIColor *)backSeletedColor{
    _backSeletedColor = backSeletedColor;
    if (_backColor) {
        [self reloadData];
    }
}
#pragma mark - 滚动方向
-(void)setRollingDirection:(NSString *)rollingDirection{
    _rollingDirection = rollingDirection;
    if ([_rollingDirection isEqualToString:@"横向"]) {
        self.flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        [self reloadData];
    }
    if ([_rollingDirection isEqualToString:@"竖向"]) {
        self.flow.scrollDirection = UICollectionViewScrollDirectionVertical;
        [self reloadData];
    }
}
#pragma mark - 设置选中
-(void)setCellIndexPath:(NSInteger)cellIndexPath{
    _cellIndexPath = cellIndexPath;
    if (_cellIndexPath < self.titleArr.count) {
        [self reloadData];
    }
    else{
        _cellIndexPath = self.titleArr.count-1;
    }
        
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
