//
//  DemoMainViewController.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/13.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "DemoMainViewController.h"
#import <IGListKit.h>

@interface DemoMainViewController ()<IGListAdapterDataSource>

@property (nonatomic,strong) IGListAdapter *adaper;
@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation DemoMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.collectionView];
    
    IGListAdapterUpdater *adapterUpdater = [[IGListAdapterUpdater alloc]init];
    self.adaper = [[IGListAdapter alloc]initWithUpdater:adapterUpdater viewController:self];
    self.adaper.collectionView = self.collectionView;
    self.adaper.dataSource = self;
    
   
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor greenColor];
    }
    return _collectionView;
}

- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return nil;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    return nil;
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{
    return nil;
}

@end
