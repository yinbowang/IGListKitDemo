//
//  MixedDataViewController.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/8/16.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "MixedDataViewController.h"
#import "GridItem.h"
#import "User.h"
#import "ExpandableSectionController.h"
#import "GridSectionController.h"
#import "UserSectionController.h"

@interface MixedDataViewController ()<IGListAdapterDataSource>

@property (nonatomic, strong) NSArray *segments;
@property (nonatomic, copy) Class selectedClass;

@end

@implementation MixedDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *map = [@[] mutableCopy];
    for (NSArray *item in self.segments) {
        [map addObject:item[0]];
    }
    
    UISegmentedControl *control = [[UISegmentedControl alloc] initWithItems:[map copy]];
    [control setSelectedSegmentIndex:0];
    [control addTarget:self action:@selector(onControl:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = control;
    
    self.adapter.dataSource = self;
    
    self.dataArray = @[
                   @"Maecenas faucibus mollis interdum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.",
                   [[GridItem alloc] initWithColor:[UIColor colorWithRed:237/255.0 green:73/255.0 blue:86/255.0 alpha:1] itemCount:6],
                   [[User alloc] initWithPk:2 name:@"Ryan Olson" handle:@"ryanolsonk"],
                   @"Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
                   [[User alloc] initWithPk:4 name:@"Oliver Rickard" handle:@"ocrickard"],
                   [[GridItem alloc] initWithColor:[UIColor colorWithRed:56/255.0 green:151/255.0 blue:240/255.0 alpha:1] itemCount:5],
                   @"Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
                   [[User alloc] initWithPk:3 name:@"Jesse Squires" handle:@"jesse_squires"],
                   [[GridItem alloc] initWithColor:[UIColor colorWithRed:112/255.0 green:192/255.0 blue:80/255.0 alpha:1] itemCount:3],
                   @"Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
                   [[GridItem alloc] initWithColor:[UIColor colorWithRed:163/255.0 green:42/255.0 blue:186/255.0 alpha:1] itemCount:7],
                   [[User alloc] initWithPk:1 name:@"Ryan Nystrom" handle:@"_ryannystrom"]
                   ];
    
    [self.adapter performUpdatesAnimated:YES completion:nil];
    
}


#pragma mark - IGListAdapterDataSource
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {

    if (self.selectedClass) {

        NSMutableArray *array = [@[] mutableCopy];
        for (id object in self.dataArray) {
            if ([object isKindOfClass:self.selectedClass]) {
                [array addObject:object];
            }
        }
        return [array copy];
    } else {
        return self.dataArray;
    }
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    if ([object isKindOfClass:[NSString class]]) {
        return [[ExpandableSectionController alloc] init];
    } else if ([object isKindOfClass:[GridItem class]]) {
        return [[GridSectionController alloc] init];
    } else {
        return [[UserSectionController alloc] init];
    }
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}


- (void)onControl:(UISegmentedControl *)control {
    NSString *classStr = [[self.segments objectAtIndex:control.selectedSegmentIndex] objectAtIndex:1];
    self.selectedClass = NSClassFromString(classStr);
    
    [self.adapter performUpdatesAnimated:YES completion:nil];
}

- (NSArray *)segments{
    if (_segments == nil){
        _segments = @[
                      @[@"全部", @""],
                      @[@"颜色", NSStringFromClass(GridItem.class)],
                      @[@"文本", NSStringFromClass(NSString.class)],
                      @[@"用户", NSStringFromClass(User.class)]
                      ];
    }
    return _segments;
}



@end
