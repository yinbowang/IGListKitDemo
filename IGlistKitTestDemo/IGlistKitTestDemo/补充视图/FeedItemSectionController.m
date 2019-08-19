//
//  FeedItemSectionController.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/19.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "FeedItemSectionController.h"
#import "FeedItem.h"
#import "DemoCell.h"
#import "UserHeaderView.h"

@interface FeedItemSectionController () <IGListSupplementaryViewSource>

@property (nonatomic, strong) FeedItem *feedItem;

@end

@implementation FeedItemSectionController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.supplementaryViewSource = self;
    }
    return self;
}

- (NSInteger)numberOfItems {
    return self.feedItem.comments.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    DemoCell *cell = [self.collectionContext dequeueReusableCellOfClass:[DemoCell class] forSectionController:self atIndex:index];
    cell.name = self.feedItem.comments[index];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    if ([object isKindOfClass:[FeedItem class]]) {
        self.feedItem = (FeedItem *)object;
    }
}

#pragma mark - IGListSupplementaryViewSource
- (NSArray<NSString *> *)supportedElementKinds {
    return @[UICollectionElementKindSectionHeader];
}

- (UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index {
    UserHeaderView *view = [self.collectionContext dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader forSectionController:self nibName:@"UserHeaderView" bundle:nil atIndex:index];
    view.handle = [@"@" stringByAppendingString:self.feedItem.user.handle];
    view.name = self.feedItem.user.name;
    return view;
}

- (CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 40);
}
@end

