//
//  LoadMoreViewController.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/14.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "LoadMoreViewController.h"
#import "LabelSectionController.h"
#import "LoadMoreFooterSectionController.h"
#import "NSArray+Number.h"

@interface LoadMoreViewController ()<IGListAdapterDataSource, UIScrollViewDelegate>

@property (nonatomic, assign) BOOL loading;
@property (nonatomic, copy) NSString *spinToken;

@end

@implementation LoadMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.adapter.dataSource = self;
    self.adapter.scrollViewDelegate = self;
    self.dataArray = [NSArray arrayWithNumber:@20];
    self.spinToken = @"哈哈哈哈😄";
    [self.adapter performUpdatesAnimated:YES completion:nil];
    
}



- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    
    NSArray *objects = self.dataArray;
    
    if (self.loading) {
        objects = [self.dataArray arrayByAddingObject:self.spinToken];
    }
    
    return objects;
    
}


- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    if ([object isKindOfClass:NSString.class] && [(NSString *)object isEqualToString:self.spinToken]) {
        return [LoadMoreFooterSectionController instance];
    }else{
        return [LabelSectionController new];
    }
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{
    return nil;
}


- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    CGFloat distance = scrollView.contentSize.height - (targetContentOffset->y + scrollView.bounds.size.height);
    
    if (self.loading == NO && distance < 200) {
        self.loading = YES;
        [self.adapter performUpdatesAnimated:YES completion:nil];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(1);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.loading = NO;
                NSUInteger itemCount = self.dataArray.count;
                self.dataArray = [self.dataArray arrayByAddingObjectsFromArray:[NSArray arrayWithFrom:itemCount to:itemCount+5]];
                [self.adapter performUpdatesAnimated:YES completion:nil];
                
            });
        });
        
    }
}


@end
