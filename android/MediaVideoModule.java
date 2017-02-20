package com.nat.weex;

import com.nat.media_video.HLModuleResultListener;
import com.nat.media_video.HLVideoModule;
import com.taobao.weex.annotation.JSMethod;
import com.taobao.weex.bridge.JSCallback;
import com.taobao.weex.common.WXModule;

/**
 * Created by Daniel on 17/2/17.
 * Copyright (c) 2017 Nat. All rights reserved.
 */

public class MediaVideoModule extends WXModule {

    @JSMethod
    public void play(String path, final JSCallback jsCallback) {
        HLVideoModule.getInstance(mWXSDKInstance.getContext()).play(path, new HLModuleResultListener() {
            @Override
            public void onResult(Object o) {
                jsCallback.invoke(o);
            }
        });
    }

    @JSMethod
    public void pause(final JSCallback jsCallback) {
        HLVideoModule.getInstance(mWXSDKInstance.getContext()).pause(new HLModuleResultListener() {
            @Override
            public void onResult(Object o) {
                jsCallback.invoke(o);
            }
        });
    }

    @JSMethod
    public void stop(final JSCallback jsCallback) {
        HLVideoModule.getInstance(mWXSDKInstance.getContext()).stop(new HLModuleResultListener() {
            @Override
            public void onResult(Object o) {
                jsCallback.invoke(o);
            }
        });
    }
}
