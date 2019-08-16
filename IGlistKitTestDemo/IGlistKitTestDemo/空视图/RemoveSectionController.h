//
//  RemoveSectionController.h
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/16.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import <IGListKit/IGListKit.h>

@class RemoveSectionController;

@protocol RemoveSectionControllerDelegate <NSObject>

- (void)removeSectionControllerWantsRemoved:(RemoveSectionController *)removeSectionController;

@end

@interface RemoveSectionController : IGListSectionController

@property (nonatomic, weak) id<RemoveSectionControllerDelegate> delegate;
@property (nonatomic, assign) NSInteger number;


@end
