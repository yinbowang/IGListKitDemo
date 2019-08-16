//
//  SearchSectionCotroller.h
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/16.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "IGListSectionController.h"

NS_ASSUME_NONNULL_BEGIN

@class SearchSectionCotroller;

@protocol SearchSectionCotrollerDelegate <NSObject>

- (void)searchSectionController:(SearchSectionCotroller *)searchSectionController didChangeText:(NSString *)text;

@end

@interface SearchSectionCotroller : IGListSectionController <UISearchBarDelegate, IGListScrollDelegate>

@property (nonatomic, weak) id<SearchSectionCotrollerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
