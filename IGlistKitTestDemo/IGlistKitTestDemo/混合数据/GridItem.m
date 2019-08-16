//
//  GridItem.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/16.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "GridItem.h"

@implementation GridItem

- (instancetype)initWithColor:(UIColor *)color itemCount:(NSInteger)itemCount
{
    self = [super init];
    if (self) {
        _color = color;
        _itemCount = itemCount;
    }
    return self;
}

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    return self == object ? YES : [self isEqual:object];
}

@end
