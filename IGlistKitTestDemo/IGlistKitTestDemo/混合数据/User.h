//
//  User.h
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/16.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject<IGListDiffable>

@property (nonatomic, assign, readonly) NSInteger pk;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *handle;

- (instancetype)initWithPk:(NSInteger)pk name:(NSString *)name handle:(NSString *)handle;

@end

NS_ASSUME_NONNULL_END
