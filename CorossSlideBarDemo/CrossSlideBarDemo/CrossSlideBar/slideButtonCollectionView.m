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
@interface slideButtonCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
//布局流
@property(nonatomic,strong)UICollectionViewFlowLayout * flow;
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
        self.cellWeight = @"0";
        self.cellHeight = @"0";
        self.bottomLinColor = [UIColor redColor];
        self.textLabFont = [UIFont systemFontOfSize:14];
        self.textSeletedLabFont = [UIFont systemFontOfSize:16];
        self.textSeltedColor = [UIColor blackColor];
        self.bottomLinHeight = 2;
        self.bottomLinSeltedColor = [UIColor redColor];
        self.bottomLinColor = [UIColor clearColor];
        self.textColor = [UIColor blackColor];
        self.bottomLinImage = [UIImage imageNamed:@""];
        self.rollingDirection = @"横向";
        self.borderWidth = 0;
        self.borderSeletedColor = [UIColor clearColor];
        self.borderColor = [UIColor clearColor];
        self.minimumitemSpacing = 0;
        self.minimumLineSpacing = 0;
    }
    return self;
}
-(UICollectionViewFlowLayout *)flow{
    if (!_flow) {
        //创建流布局对象
        _flow = [[UICollectionViewFlowLayout alloc]init];
        _flow.minimumLineSpacing = 0;
        _flow.minimumInteritemSpacing = 0;
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
#pragma mark - 两个cell之间的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return self.minimumitemSpacing;
}

#pragma mark - 两行之间的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return self.minimumLineSpacing;
}
#pragma mark - 单元格大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([_rollingDirection isEqualToString:@"横向"]) {
        if ([self.cellWeight floatValue] <= 0) {
             CGFloat collectionCellW = [self calculateRowWidth:self.titleArr[indexPath.row] Fount:self.textLabFont andHeight:self.frame.size.height]+20;
            return CGSizeMake(collectionCellW, self.frame.size.height);
        }
        else{
            return CGSizeMake([self.cellWeight floatValue], self.frame.size.height);
        }
    }
    if ([_rollingDirection isEqualToString:@"竖向"]) {
        if ([self.cellHeight floatValue] <= 0) {
            CGFloat collectionCellH = [self getStringHeightWithText:self.titleArr[indexPath.row] font:self.textLabFont viewWidth:self.frame.size.width] + 20;
            return CGSizeMake(self.frame.size.width,collectionCellH);
        }
        else{
            return CGSizeMake(self.frame.size.width, [self.cellHeight floatValue]);
        }
        return CGSizeMake(self.frame.size.width, 40);
    }
    return CGSizeMake(0, 0);
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
//    显示文字
    cell.textTitleString = self.titleArr[indexPath.row];
//    底线高度
    cell.bottomLinHeight = self.bottomLinHeight;
//    底线宽度
    if (self.bottomLinWeight > 0) {
        cell.bottomLinWeight = self.bottomLinWeight;
    }
    else{
         CGFloat collectionCellW = [self calculateRowWidth:self.titleArr[indexPath.row] Fount:self.textLabFont andHeight:self.frame.size.height]+20;
        cell.bottomLinWeight = collectionCellW;
    }
//    边框宽度
    cell.borderWidth = self.borderWidth;
    #pragma mark - 如若选中
    if (self.cellIndexPath == indexPath.row) {
        cell.textLabFont = self.textSeletedLabFont;
        cell.textColor = self.textSeltedColor;
        cell.borderColor = self.borderSeletedColor;
        if (self.bottomSeletdLinImage) {
            cell.bottomLinColor = [UIColor clearColor];
        }
        else{
            cell.bottomLinColor = self.bottomLinSeltedColor;
        }
        cell.bottomLinImage = self.bottomSeletdLinImage;
        cell.backSeletedColor = self.backSeletedColor;
    }
    #pragma mark - 如若未选中
    else{
        cell.textLabFont = self.textLabFont;
        cell.textColor = self.textColor;
        cell.bottomLinImage = self.bottomLinImage;
        cell.bottomLinColor = self.bottomLinColor;
        cell.backSeletedColor = self.backColor;
        cell.borderColor = self.borderColor;
    }
    return cell;
}
#pragma mark - 点击单元格
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.cellIndexPath = indexPath.row;
    if ([_rollingDirection isEqualToString:@"横向"]) {
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    else{
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
    }
    self.ClickTitleReturn(self.titleArr[indexPath.row]);
    [self reloadData];
}
#pragma mark - 字符串宽度
- (CGFloat)calculateRowWidth:(NSString *)string Fount:(UIFont *)fount andHeight:(CGFloat)height{
    NSDictionary *dic = @{NSFontAttributeName:fount};  //指定字号
    CGRect rect = [string boundingRectWithSize:CGSizeMake(0, height)/*计算宽度时要确定高度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.width;
}
#pragma mark - 返回文字占用高度
-(CGFloat)getStringHeightWithText:(NSString *)text font:(UIFont *)font viewWidth:(CGFloat)width
{
    // 设置文字属性 要和label的一致
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    // 计算文字占据的高度
    CGSize size = [text boundingRectWithSize:maxSize options:options attributes:attrs context:nil].size;
    //    当你是把获得的高度来布局控件的View的高度的时候.size转化为ceilf(size.height)。
    return  ceilf(size.height);
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
    if (_automatic) {
        if ([_rollingDirection isEqualToString:@"横向"]) {
            [self scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_cellIndexPath inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
        else{
            [self scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:_cellIndexPath inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
        }
    }
}
#pragma mark - 设置标题宽度
-(void)setCellWeight:(NSString *)cellWeight{
    _cellWeight = cellWeight;
    [self reloadData];
}
-(void)setCellHeight:(NSString *)cellHeight{
    _cellHeight = cellHeight;
    [self reloadData];
}
#pragma mark - 设置边框宽度
-(void)setBorderWidth:(CGFloat)borderWidth{
    _borderWidth = borderWidth;
    [self reloadData];
}
#pragma mark - 设置选中边框颜色
-(void)setBorderSeletedColor:(UIColor *)borderSeletedColor{
    _borderSeletedColor = borderSeletedColor;
    [self reloadData];
}
#pragma mark - 设置未选边框颜色
-(void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    [self reloadData];
}
#pragma mark - 设置行间距
-(void)setMinimumitemSpacing:(CGFloat)minimumitemSpacing{
    _minimumitemSpacing = minimumitemSpacing;
    if (_minimumitemSpacing) {
        [self reloadData];
    }
}
#pragma mark - 设置列间距
-(void)setMinimumLineSpacing:(CGFloat)minimumLineSpacing{
    _minimumLineSpacing = minimumLineSpacing;
    if (_minimumLineSpacing) {
        [self reloadData];
    }
}
#pragma mark - 设置底线宽度
-(void)setBottomLinWeight:(CGFloat)bottomLinWeight{
    _bottomLinWeight = bottomLinWeight;
    if (_bottomLinWeight) {
        [self reloadData];
    }
}
#pragma mark - 自动调整
-(void)setAutomatic:(BOOL)automatic{
    _automatic = automatic;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
