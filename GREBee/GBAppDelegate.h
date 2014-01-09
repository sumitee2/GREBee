//
//  GBAppDelegate.h
//  GREBee
//
//  Created by Ophio Admin on 02/01/14.
//  Copyright (c) 2014 Techno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GBAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator ;
@property (strong, nonatomic) UIWindow *window;

@end
