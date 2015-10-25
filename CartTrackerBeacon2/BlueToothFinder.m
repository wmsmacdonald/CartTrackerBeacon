//
//  BlueToothFinder.m
//  CartTracker
//
//  Created by Mike Dokken on 10/24/15.
//  Copyright © 2015 Mike Dokken. All rights reserved.
//

@import CoreBluetooth;
#import "BlueToothFinder.h"

@interface BlueToothFinder () <CBCentralManagerDelegate>

@property (nonatomic, strong) CBCentralManager *cbManager;

@end

@implementation BlueToothFinder

- (instancetype)init {
    NSLog(@"init");
    if (self = [super init]) {
        _cbManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    }
    return self;
}

#pragma mark - CBCentralManagerDelegate

- (void)centralManager:(CBCentralManager *)central
 didDiscoverPeripheral:(CBPeripheral *)peripheral
     advertisementData:(NSDictionary<NSString *,
                        id> *)advertisementData
                  RSSI:(NSNumber *)RSSI {
    if ([advertisementData[CBAdvertisementDataLocalNameKey] isEqualToString:@"cart_tracker"]) {
        NSLog(@"cart_tracker");
    }
    NSLog(@"RSSI = %@, uuid = %@", RSSI, peripheral.identifier.UUIDString);
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    NSLog(@"centralManagerDidUpdateState state = %ld", (long)central.state);
    
    if (central.state == CBCentralManagerStatePoweredOn) {
        NSLog(@"CBCentralManagerStatePoweredOn");
        //[_cbManager scanForPeripheralsWithServices:nil options:nil];
        [_cbManager scanForPeripheralsWithServices:nil options:@{CBCentralManagerScanOptionAllowDuplicatesKey : @NO}];
    }
}

@end
