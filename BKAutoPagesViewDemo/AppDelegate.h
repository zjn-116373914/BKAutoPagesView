//
//  AppDelegate.h
//  BKAutoPagesViewDemo
//
//  Created by 张加宁 on 2017/5/16.
//  Copyright © 2017年 BlackKnife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

