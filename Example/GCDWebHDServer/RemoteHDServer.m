//
//  RemoteHDServer.m
//  GCDWebHDServer
//
//  Created by YLCHUN on 2019/7/17.
//  Copyright © 2019 YLCHUN. All rights reserved.
//

#import "RemoteHDServer.h"
#import "GCDWebHDServer.h"

@implementation RemoteHDServer
{
    GCDWebHDServer * _hdServer;
}

- (instancetype)init {
    if (self = [super init]) {
        _hdServer = [[GCDWebHDServer alloc] initWithDirectory:NSHomeDirectory()];
        [GCDWebHDServer setLogLevel:5];
    }
    return self;
}

- (void)start {
    [self startWithPort:8888];
}

- (void)startWithPort:(NSUInteger)port {
    [_hdServer startWithPort:port bonjourName:@"RemoteHDServer"];
}

- (void)stop {
    [_hdServer stop];
}

- (NSURL *)url {
    return _hdServer.serverURL;
}

+ (instancetype)share {
    return [self new];
}

@end
