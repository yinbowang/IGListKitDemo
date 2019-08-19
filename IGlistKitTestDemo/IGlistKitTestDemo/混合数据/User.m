//
//  User.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/16.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithPk:(NSInteger)pk name:(NSString *)name handle:(NSString *)handle
{
    self = [super init];
    if (self) {
        _pk = pk;
        _name = name;
        _handle = handle;
    }
    return self;
}

+ (instancetype)userWithPk:(NSInteger)pk name:(NSString *)name handle:(NSString *)handle {
    return [[self alloc] initWithPk:pk name:name handle:handle];
}

- (id<NSObject>)diffIdentifier {
    return [NSNumber numberWithInteger:_pk];
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    if ([self isEqual:object]) {
        return YES;
    } else {
        if (![(NSObject *)object isKindOfClass:[User class]]) {
            return NO;
        }
        
        User *oobject = (User *)object;
        return [_name isEqualToString:oobject.name] && [_handle isEqualToString:oobject.handle];
    }
}

@end
