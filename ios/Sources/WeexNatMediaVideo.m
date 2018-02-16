//
//  WeexNatVideo.m
//
//  Created by huangyake on 17/1/7.
//  Copyright © 2017 Instapp. All rights reserved.
//

#import "WeexNatMediaVideo.h"
#import <WeexPluginLoader/WeexPluginLoader.h>
#import <NatVideo/NatVideo.h>

@implementation WeexNatMediaVideo
@synthesize weexInstance;

WX_PlUGIN_EXPORT_MODULE(nat/media/video, WeexNatMediaVideo)
WX_EXPORT_METHOD(@selector(play::))
WX_EXPORT_METHOD(@selector(pause:))
WX_EXPORT_METHOD(@selector(stop:))

- (void)play:(NSString *)path :(WXModuleCallback)callback{
    [[NatVideo singletonManger] play:path :^(id error,id result) {
        if (callback) {
            if (error) {
                callback(error);
            } else {
                callback(result);
            }
        }
    }];
}

- (void)pause:(WXModuleCallback)callback{
    [[NatVideo singletonManger] pause:^(id error,id result) {
        if (callback) {
            if (error) {
                callback(error);
            } else {
                callback(result);
            }
        }
    }];
}

- (void)stop:(WXModuleCallback)callback{
    [[NatVideo singletonManger] stop:^(id error,id result) {
        if (callback) {
            if (error) {
                callback(error);
            } else {
                callback(result);
            }
        }
    }];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
