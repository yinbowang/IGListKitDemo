//
//  LoadMoreFooterCell.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/15.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "LoadMoreFooterCell.h"

@implementation LoadMoreFooterCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initSetup];
        
    }
    return self;
}

- (void)initSetup {
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.contentView addSubview:_activityIndicator];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.contentView.bounds;
    
    [self.activityIndicator setCenter:CGPointMake(bounds.size.width/2, bounds.size.height/2)];
}

@end
