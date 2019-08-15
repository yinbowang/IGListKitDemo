//
//  LoadMoreFooterSectionController.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/15.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "LoadMoreFooterSectionController.h"
#import "LoadMoreFooterCell.h"

@implementation LoadMoreFooterSectionController

+ (IGListSingleSectionController *)instance{
    return [[IGListSingleSectionController alloc]initWithCellClass:LoadMoreFooterCell.class configureBlock:^(id  _Nonnull item, __kindof UICollectionViewCell * _Nonnull cell) {
        if ([cell isKindOfClass:[LoadMoreFooterCell class]]) {
            [((LoadMoreFooterCell *)cell).activityIndicator startAnimating];
        }
    } sizeBlock:^CGSize(id  _Nonnull item, id<IGListCollectionContext>  _Nullable collectionContext) {
        return CGSizeMake(collectionContext.containerSize.width, 100);
    }];
}

@end
