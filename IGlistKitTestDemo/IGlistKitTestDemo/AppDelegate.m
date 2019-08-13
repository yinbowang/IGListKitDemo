//
//  AppDelegate.m
//  IGlistKitTestDemo
//
//  Created by wyb on 2019/7/30.
//  Copyright © 2019 世纪佳缘. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoMainViewController.h"
#import <FLEX/FLEXManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UIViewController *vc = [DemoMainViewController new];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    UIPinchGestureRecognizer *pg = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(showDebugExplorer)];
    [self.window addGestureRecognizer:pg];
    [[FLEXManager sharedManager] setNetworkDebuggingEnabled:YES];
    
    return YES;
}

- (void)showDebugExplorer {
    [[FLEXManager sharedManager] showExplorer];
}



@end
