//
//  SearchCell.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/16.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "SearchCell.h"

@implementation SearchCell

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] init];
    }
    return _searchBar;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.searchBar];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.searchBar setFrame:self.contentView.bounds];
}

@end
