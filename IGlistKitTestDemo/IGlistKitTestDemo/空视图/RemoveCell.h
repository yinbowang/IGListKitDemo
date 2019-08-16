//
//  RemoveCell.h
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/16.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RemoveCell;

@protocol RemoveCellDelegate <NSObject>

- (void)removeCellDidTapButton:(RemoveCell *)removeCell;

@end

@interface RemoveCell : UICollectionViewCell

@property (nonatomic, weak) id<RemoveCellDelegate> delegate;
@property (nonatomic, copy) NSString *text;

@end
