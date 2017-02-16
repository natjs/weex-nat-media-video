//
//  NatWeexVideo.m
//
//  Created by huangyake on 17/1/7.
//  Copyright © 2017 Nat. All rights reserved.
//

#import "NatWeexVideo.h"
#import "NatVideo.h"

@implementation NatWeexVideo
WX_EXPORT_METHOD(@selector(play::))
WX_EXPORT_METHOD(@selector(pause:))
WX_EXPORT_METHOD(@selector(stop:))


- (void)play:(NSString *)path :(WXModuleCallback)callback{
    
    [[NatVideo singletonManger] play:path :^(id error,id result) {
        if (error) {
            if (callback) {
                callback(error);
            }
        }else{
            if (callback) {
                callback(result);
            }
        }
    }];
}

- (void)pause:(WXModuleCallback)callback{
    [[NatVideo singletonManger] pause:^(id error,id result) {
        if (error) {
            if (callback) {
                callback(error);
            }
        }else{
            if (callback) {
                callback(result);
            }
        }
    }];
}
- (void)stop:(WXModuleCallback)callback{
    [[NatVideo singletonManger] stop:^(id error,id result) {
        if (error) {
            if (callback) {
                callback(error);
            }
        }else{
            if (callback) {
                callback(result);
            }
        }
    }];
}
-(void)dealloc{
    //移除所有通知监控
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
