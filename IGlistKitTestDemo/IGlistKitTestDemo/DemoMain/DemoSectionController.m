//
//  DemoSectionController.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/14.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "DemoSectionController.h"
#import "DemoCell.h"

@implementation DemoSectionController

- (NSInteger)numberOfItems{
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index{
    return CGSizeMake(self.collectionContext.containerSize.width, 60);
}

- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    DemoCell *cell = [self.collectionContext dequeueReusableCellOfClass:DemoCell.class forSectionController:self atIndex:index];
    cell.name = self.model.name;
    return cell;
}

- (void)didUpdateToObject:(id)object{
    self.model = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index{
    UIViewController *vc = [self.model.pushControllerClass new];
    vc.navigationItem.title = self.model.name;
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

@end
