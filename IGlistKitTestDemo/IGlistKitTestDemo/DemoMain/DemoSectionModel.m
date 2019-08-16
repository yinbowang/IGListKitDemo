//
//  DemoSectionModel.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/13.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "DemoSectionModel.h"
#import <IGListKit/IGListDiff.h>

@interface DemoSectionModel ()<IGListDiffable>

@end

@implementation DemoSectionModel

- (nonnull id<NSObject>)diffIdentifier{
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object{
    return self == object;
}

@end
