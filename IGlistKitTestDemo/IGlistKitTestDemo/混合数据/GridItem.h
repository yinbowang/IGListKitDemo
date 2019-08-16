//
//  GridItem.h
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/16.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface GridItem : NSObject <IGListDiffable>

@property (nonatomic, strong, readonly) UIColor *color;
@property (nonatomic, assign, readonly) NSInteger itemCount;

- (instancetype)initWithColor:(UIColor *)color itemCount:(NSInteger)itemCount;

@end

NS_ASSUME_NONNULL_END
