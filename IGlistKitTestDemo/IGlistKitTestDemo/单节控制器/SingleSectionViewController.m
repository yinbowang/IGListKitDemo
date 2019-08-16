//
//  SingleSectionViewController.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/16.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "SingleSectionViewController.h"
#import <IGListKit.h>
#import "NSArray+Number.h"
#import "NibCell.h"

@interface SingleSectionViewController () <IGListAdapterDataSource, IGListSingleSectionControllerDelegate>

@end

@implementation SingleSectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSArray arrayWithNumber:@20];
    [self.adapter setDataSource:self];
}

#pragma mark - IGListAdapterDataSource
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    
    IGListSingleSectionController *sectionController = [[IGListSingleSectionController alloc] initWithNibName:@"NibCell" bundle:nil configureBlock:^(id  _Nonnull item, __kindof UICollectionViewCell * _Nonnull cell) {
        
        if ([cell isKindOfClass:[NibCell class]]) {
            NibCell *ccell = (NibCell *)cell;
            
            if ([item isKindOfClass:[NSNumber class]]) {
                NSInteger number = [(NSNumber *)item integerValue];
                ccell.text = [@"Cell: " stringByAppendingFormat:@"%ld", number+1];
            }
        }
    } sizeBlock:^CGSize(id  _Nonnull item, id<IGListCollectionContext>  _Nullable collectionContext) {
        
        return CGSizeMake(collectionContext.containerSize.width, 44);
    }];
    [sectionController setSelectionDelegate:self];
    
    return sectionController;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

#pragma mark - IGListSingleSectionControllerDelegate
- (void)didSelectSectionController:(IGListSingleSectionController *)sectionController withObject:(id)object {
    NSInteger section = [self.adapter sectionForSectionController:sectionController] + 1;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:[@"Section " stringByAppendingFormat:@"%ld was seleted 🎉", section] message:[@"Cell Object: " stringByAppendingFormat:@"%@", [object description]] preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}
@end

