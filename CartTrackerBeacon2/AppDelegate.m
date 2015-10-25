//
//  AppDelegate.m
//  CartTrackerBeacon2
//
//  Created by Mike Dokken on 10/24/15.
//  Copyright © 2015 Mike Dokken. All rights reserved.
//

#import "AppDelegate.h"
#import "BlueToothFinder.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    BlueToothFinder *b = [[BlueToothFinder alloc] init];
    [b go];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
