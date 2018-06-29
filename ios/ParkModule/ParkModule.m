//
//  ParkModule.m
//  ParkModule
//
//  Created by 蔡太闲 on 2018/6/29.
//  Copyright © 2018年 sihenggroup. All rights reserved.
//

#import "ParkModule.h"

@implementation ParkModule

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(testPrint:(NSString *)name info:(NSDictionary *)info) {
//    RCTLogInfo(@"%@: %@", name, info);
    NSLog(@"%@",name);
}

RCT_EXPORT_METHOD(getNativeClass:(RCTResponseSenderBlock)callback) {
    callback(@[NSStringFromClass([self class])]);
}

RCT_REMAP_METHOD(testRespondMethod,
                 name:(NSString *)name
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
    if([self respondsToSelector:NSSelectorFromString(name)]) {
        resolve(@YES);
    }
    else {
        reject(@"-1001", @"not respond this method", nil);
    }
}

- (NSDictionary *)constantsToExport {
    return @{ @"BGModuleName" : @"BGNativeModuleExample"};
}

- (NSArray<NSString *> *)supportedEvents{
    return @[@"invoke"];
}

@end
