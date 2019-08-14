//
//  DemoCell.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/14.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "DemoCell.h"
#import <Masonry.h>

@interface DemoCell ()

@property (nonatomic,strong) UILabel *textLab;
@property (nonatomic,strong) UIView *lineView;

@end

@implementation DemoCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews{
    
    [self.contentView addSubview:self.textLab];
    [self.contentView addSubview:self.lineView];
    
    [self.textLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(self.contentView);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.mas_equalTo(15);
        make.right.bottom.mas_equalTo(self.contentView);
    }];
    
}

- (void)setName:(NSString *)name{
    _name = name;
    self.textLab.text = name;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor colorWithRed:200/255.0 green:199/255.0 blue:204/255.0 alpha:1];
    }
    return _lineView;
}

- (UILabel *)textLab{
    if (_textLab == nil) {
        _textLab = [self setupLabel:@"" font:17 textColor:[UIColor blackColor]];
    }
    return _textLab;
}

- (UILabel *)setupLabel:(NSString *)text font:(NSInteger)font textColor:(UIColor *)color{
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:font];
    label.numberOfLines = 1;
    label.text = text;
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = color;
    return label;
}

@end
