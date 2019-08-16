//
//  EmptyViewController.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/16.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "EmptyViewController.h"
#import <IGListKit.h>
#import "RemoveSectionController.h"

@interface EmptyViewController () <IGListAdapterDataSource, RemoveSectionControllerDelegate>

@property (nonatomic, strong) UILabel *emptyLabel;
@property (nonatomic, assign) NSInteger tally;
@end

@implementation EmptyViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tally = 4;
    self.dataArray = @[@1, @2, @3, @4];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAdd)];
    
    [self.collectionView setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [self.adapter setDataSource:self];
}

- (UILabel *)emptyLabel {
    if (!_emptyLabel) {
        _emptyLabel = [[UILabel alloc] init];
        [_emptyLabel setNumberOfLines:0];
        [_emptyLabel setTextAlignment:NSTextAlignmentCenter];
        [_emptyLabel setBackgroundColor:[UIColor redColor]];
        [_emptyLabel setText:@"没有更多数据了!"];
    }
    return _emptyLabel;
}

- (void)onAdd {
    self.dataArray = [self.dataArray arrayByAddingObject:[NSNumber numberWithInteger:(_tally+1)]];
    self.tally++;
    [self.adapter performUpdatesAnimated:YES completion:nil];
}

#pragma mark - IGListAdapterDataSource
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return [self.dataArray copy];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    RemoveSectionController *sc = [[RemoveSectionController alloc] init];
    [sc setDelegate:self];
    
    return sc;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return self.emptyLabel;
}

#pragma mark - RemoveSectionControllerDelegate
- (void)removeSectionControllerWantsRemoved:(RemoveSectionController *)removeSectionController {
    NSInteger section = [self.adapter sectionForSectionController:removeSectionController];
    NSNumber *object = [self.adapter objectAtSection:section];
    
    NSMutableArray *datas = [self.dataArray mutableCopy];
    [datas removeObject:object];
    self.dataArray = [datas copy];
    
    [self.adapter performUpdatesAnimated:YES completion:nil];
}
@end
