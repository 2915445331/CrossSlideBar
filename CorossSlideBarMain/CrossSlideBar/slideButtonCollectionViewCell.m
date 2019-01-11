//
//  slideButtonCollectionViewCell.m
//  Cat
//
//  Created by 流年 on 2018/10/11.
//  Copyright © 2018年 霍超越你a s. All rights reserved.
//

#import "slideButtonCollectionViewCell.h"
@interface slideButtonCollectionViewCell ()
//标题
@property(nonatomic,strong)UILabel * textTitileLab;
//底线
@property(nonatomic,strong)UIView * bottomLinView;
//背景
@property(nonatomic,strong)UIView * backgroundV;
@end
@implementation slideButtonCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.textTitileLab];
        [self.contentView addSubview:self.bottomLinView];
        [self.contentView insertSubview:self.backgroundV atIndex:0];
    }
    return self;
}
#pragma mark - 标题
-(UILabel *)textTitileLab{
    if (!_textTitileLab) {
        _textTitileLab = [[UILabel alloc]init];
        _textTitileLab.textAlignment = 1;
    }
    return _textTitileLab;
}
#pragma mark - 底线
-(UIView *)bottomLinView{
    if (!_bottomLinView) {
        _bottomLinView = [[UIView alloc]init];
    }
    return _bottomLinView;
}
#pragma mark - 背景
-(UIView *)backgroundV{
    if (!_backgroundV) {
        _backgroundV = [[UIView alloc]init];
    }
    return _backgroundV;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat textHeight = self.contentView.frame.size.height-self.bottomLinHeight;
    self.textTitileLab.frame = CGRectMake(0, 0, self.contentView.frame.size.width, textHeight);
    self.bottomLinView.frame = CGRectMake(0,textHeight, self.contentView.frame.size.width, self.bottomLinHeight);
    self.backgroundV.frame = self.contentView.frame;
}
-(void)setTextTitleString:(NSString *)textTitleString{
    _textTitleString = textTitleString;
    self.textTitileLab.text = _textTitleString;
}
-(void)setTextLabFont:(UIFont *)textLabFont{
    _textLabFont = textLabFont;
    self.textTitileLab.font = _textLabFont;
}
-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    self.textTitileLab.textColor = _textColor;
}
-(void)setBottomLinHeight:(CGFloat)bottomLinHeight{
    _bottomLinHeight = bottomLinHeight;
    CGFloat textHeight = self.contentView.frame.size.height-self.bottomLinHeight;
    CGFloat bottomLinX = (self.contentView.frame.size.width * 0.5)-(_bottomLinWeight * 0.5);
    self.textTitileLab.frame = CGRectMake(0, 0, self.contentView.frame.size.width, textHeight);
    self.bottomLinView.frame = CGRectMake(bottomLinX,textHeight, _bottomLinWeight, self.bottomLinHeight);
}
-(void)setBottomLinImage:(UIImage *)bottomLinImage{
    _bottomLinImage = bottomLinImage;
    self.bottomLinView.layer.contents = (id)_bottomLinImage.CGImage;
}
-(void)setBottomLinColor:(UIColor *)bottomLinColor{
    _bottomLinColor = bottomLinColor;
    if (!self.bottomLinImage) {
        self.bottomLinView.backgroundColor = _bottomLinColor;
    }
}
-(void)setBackSeletedColor:(UIColor *)backSeletedColor{
    _backSeletedColor = backSeletedColor;
    self.backgroundV.backgroundColor = _backSeletedColor;
}
-(void)setBorderWidth:(CGFloat)borderWidth{
    _borderWidth = borderWidth;
    self.contentView.layer.borderWidth = _borderWidth;
}
-(void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    self.contentView.layer.borderColor = self.borderColor.CGColor;
}
-(void)setBottomLinWeight:(CGFloat)bottomLinWeight{
    _bottomLinWeight = bottomLinWeight;
    CGFloat textHeight = self.contentView.frame.size.height-self.bottomLinHeight;
    CGFloat bottomLinX = (self.contentView.frame.size.width * 0.5)-(_bottomLinWeight * 0.5);
    self.textTitileLab.frame = CGRectMake(0, 0, self.contentView.frame.size.width, textHeight);
    self.bottomLinView.frame = CGRectMake(bottomLinX,textHeight, _bottomLinWeight, self.bottomLinHeight);
}
@end
