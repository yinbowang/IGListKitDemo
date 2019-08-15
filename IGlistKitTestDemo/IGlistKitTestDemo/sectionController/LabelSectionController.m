//
//  LabelSectionController.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/15.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "LabelSectionController.h"
#import "DemoCell.h"
@interface LabelSectionController ()

@property (nonatomic, copy) NSString *object;

@end

@implementation LabelSectionController

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    DemoCell *cell = [self.collectionContext dequeueReusableCellOfClass:DemoCell.class forSectionController:self atIndex:index];
    cell.name = self.object;
    return cell;
}

- (void)didUpdateToObject:(id)object {
    self.object = [object description];
}

@end
