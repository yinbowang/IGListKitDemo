//
//  FeedItem.h
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/19.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface FeedItem : NSObject <IGListDiffable>

@property (nonatomic, assign, readonly) NSInteger pk;
@property (nonatomic, strong, readonly) User *user;
@property (nonatomic, strong, readonly) NSArray<NSString *> *comments;

- (instancetype)initWithPk:(NSInteger)pk user:(User *)user comments:(NSArray<NSString *> *)comments NS_DESIGNATED_INITIALIZER;
+ (instancetype)feedItemWithPk:(NSInteger)pk user:(User *)user comments:(NSArray<NSString *> *)comments;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@end
