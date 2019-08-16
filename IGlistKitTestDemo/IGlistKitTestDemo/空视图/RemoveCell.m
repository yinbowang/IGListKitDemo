//
//  RemoveCell.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/16.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "RemoveCell.h"

@interface RemoveCell ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *button;

@end

@implementation RemoveCell

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        [_label setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_label];
    }
    return _label;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"移除" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_button setBackgroundColor:[UIColor clearColor]];
        [_button addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_button];
    }
    return _button;
}

- (NSString *)text {
    return self.label.text;
}

- (void)setText:(NSString *)text {
    self.label.text = text;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    CGRect bounds = self.contentView.bounds;
    
    CGRect slice, remainder;
    CGRectDivide(bounds, &slice, &remainder, 100, CGRectMaxXEdge);
    
    [self.label setFrame:CGRectInset(slice, 15, 0)];
    [self.button setFrame:remainder];
}

- (void)onButton:(UIButton *)button {
    if (self.delegate && [self.delegate respondsToSelector:@selector(removeCellDidTapButton:)]) {
        [self.delegate removeCellDidTapButton:self];
    }
}
@end

