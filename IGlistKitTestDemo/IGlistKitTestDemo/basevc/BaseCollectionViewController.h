//
//  BaseCollectionViewController.h
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/14.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit/IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionViewController : UIViewController

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) IGListAdapter *adapter;
@property (nonatomic,strong) NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
