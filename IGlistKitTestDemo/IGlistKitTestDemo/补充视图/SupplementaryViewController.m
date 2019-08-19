//
//  SupplementaryViewController.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/19.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "SupplementaryViewController.h"
#import "FeedItem.h"
#import "FeedItemSectionController.h"

@interface SupplementaryViewController ()<IGListAdapterDataSource>

@end

@implementation SupplementaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[
                   [FeedItem feedItemWithPk:1 user:[User userWithPk:100 name:@"Jesse" handle:@"jesse_squires"] comments:@[@"You rock!", @"Hmm you sure about that?"]],
                   [FeedItem feedItemWithPk:2 user:[User userWithPk:101 name:@"Ryan" handle:@"_ryannystrom"] comments:@[@"lgtm", @"lol", @"Let's try it!"]],
                   [FeedItem feedItemWithPk:3 user:[User userWithPk:102 name:@"Ann" handle:@"abaum"] comments:@[@"Good luck!"]],
                   [FeedItem feedItemWithPk:4 user:[User userWithPk:103 name:@"Phil" handle:@"phil"] comments:@[@"yoooooooo", @"What's the eta?"]],
                   ];
    self.adapter.dataSource = self;
    
}

#pragma mark - IGListAdapterDataSource
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    FeedItemSectionController *sc = [[FeedItemSectionController alloc] init];
    
    return sc;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

@end
