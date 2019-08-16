//
//  RemoveSectionController.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/16.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "RemoveSectionController.h"
#import "RemoveCell.h"

@interface RemoveSectionController () <RemoveCellDelegate>

@end

@implementation RemoveSectionController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setInset:UIEdgeInsetsMake(0, 0, 10, 0)];
    }
    return self;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    RemoveCell *cell = [self.collectionContext dequeueReusableCellOfClass:[RemoveCell class] forSectionController:self atIndex:index];
    
    [cell setText:[NSString stringWithFormat:@"Cell: %ld", _number]];
    [cell setDelegate:self];
    
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.number = [object integerValue];
}

#pragma mark - RemoveCellDelegate
- (void)removeCellDidTapButton:(RemoveCell *)removeCell {
    if (self.delegate && [self.delegate respondsToSelector:@selector(removeSectionControllerWantsRemoved:)]) {
        [self.delegate removeSectionControllerWantsRemoved:self];
    }
}

@end
