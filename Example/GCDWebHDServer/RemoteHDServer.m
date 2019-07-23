//
//  RemoteHDServer.m
//  GCDWebHDServer
//
//  Created by YLCHUN on 2019/7/17.
//  Copyright © 2019 YLCHUN. All rights reserved.
//

#import "RemoteHDServer.h"
#import "GCDWebHDServer.h"
#import <sys/param.h>
#import <sys/mount.h>

@interface RemoteHDServer()<GCDWebHDServerDelegate>

@end
@implementation RemoteHDServer
{
    GCDWebHDServer * _hdServer;
}

- (instancetype)init {
    if (self = [super init]) {
        _hdServer = [[GCDWebHDServer alloc] initWithDirectory:NSHomeDirectory()];
        [GCDWebHDServer setLogLevel:5];
        _hdServer.delegate = self;
    }
    return self;
}

- (void)webServerDidConnect:(GCDWebServer *)server {
        NSLog(@"");
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


+ (unsigned long long)space {
    struct statfs buf;
    unsigned long long space = -1;
    if (statfs("/var", &buf) >= 0) {
        space = (unsigned long long)(buf.f_bsize * buf.f_bavail);
    }
    return space;
}

+ (instancetype)share {
    return [self new];
}

@end
