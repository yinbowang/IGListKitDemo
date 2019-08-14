//
//  DemoMainViewController.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/13.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "DemoMainViewController.h"
#import <IGListKit.h>
#import "LoadMoreViewController.h"
#import "DemoSectionModel.h"
#import "DemoSectionController.h"

@interface DemoMainViewController ()<IGListAdapterDataSource>

@property (nonatomic,strong) IGListAdapter *adaper;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation DemoMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Demos";
    
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.collectionView];
    
    IGListAdapterUpdater *adapterUpdater = [[IGListAdapterUpdater alloc]init];
    self.adaper = [[IGListAdapter alloc]initWithUpdater:adapterUpdater viewController:self];
    self.adaper.collectionView = self.collectionView;
    self.adaper.dataSource = self;
    
    NSArray *pushControllerClassArray = @[LoadMoreViewController.class];
    NSArray *nameArray = @[@"尾部加载"];
    for (NSInteger i=0; i<nameArray.count; i++) {
        DemoSectionModel *sectionModel = [[DemoSectionModel alloc]init];
        sectionModel.name = nameArray[i];
        sectionModel.pushControllerClass = pushControllerClassArray[i];
        sectionModel.sectionControllerClass = DemoSectionController.class;
        [self.dataArray addObject:sectionModel];
    }
   
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
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    DemoSectionModel *demoSectionModel = object;
    return [demoSectionModel.sectionControllerClass new];
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{
    return nil;
}

- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
