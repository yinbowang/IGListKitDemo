//
//  DemoSectionModel.h
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/13.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DemoSectionModel : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) Class pushControllerClass;
@property (nonatomic,strong) Class sectionControllerClass;

@end

NS_ASSUME_NONNULL_END
