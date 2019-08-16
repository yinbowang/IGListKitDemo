//
//  NestedAdapterViewController.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/16.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "NestedAdapterViewController.h"
#import <IGListKit.h>
#import "HorizontalSectionController.h"
#import "LabelSectionController.h"

@interface NestedAdapterViewController () <IGListAdapterDataSource>

@end

@implementation NestedAdapterViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[
                       @"Ridiculus Elit Tellus Purus Aenean",
                       @"Condimentum Sollicitudin Adipiscing",
                       @14,
                       @"Ligula Ipsum Tristique Parturient Euismod",
                       @"Purus Dapibus Vulputate",
                       @6,
                       @"Tellus Nibh Ipsum Inceptos",
                       @2
                       ];
    
    self.adapter.dataSource = self;

}


#pragma mark - IGListAdapterDataSource
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        return [[HorizontalSectionController alloc] init];
    } else {
        return [[LabelSectionController alloc] init];
    }
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}
@end
