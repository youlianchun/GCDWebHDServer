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

@implementation HDAuthAccount
{
    NSMutableDictionary *_authAccounts;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _authAccounts = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)setPassword:(NSString *)password name:(NSString *)name {
    _authAccounts[name] = password;
}

- (NSString *)passwordForName:(NSString *)name {
    return _authAccounts[name];
}

- (void)setObject:(nullable NSString *)obj forKeyedSubscript:(NSString *)key {
    [self setPassword:obj name:key];
}

- (nullable NSString *)objectForKeyedSubscript:(NSString *)key {
    return [self passwordForName:key];
}

- (NSUInteger)count {
    return _authAccounts.count;
}

- (NSDictionary *)accounts {
    return [_authAccounts copy];
}

@end

#pragma mark -

@implementation HDConfig
@end

#pragma mark -

@interface RemoteHDServer()<GCDWebHDServerDelegate>

@end
@implementation RemoteHDServer
{
    GCDWebHDServer * _hdServer;
}
@synthesize runing = _runing;

- (instancetype)init {
    if (self = [super init]) {
        _hdServer = [[GCDWebHDServer alloc] init];
        _hdServer.allowHiddenItems = YES;
        [GCDWebHDServer setLogLevel:5];
        _hdServer.delegate = self;
    }
    return self;
}

- (void)webServerDidConnect:(GCDWebServer *)server {
    
}

- (void)startWithOption:(void(^)(HDConfig *conf, HDAuthAccount *auth))option {
    HDConfig *conf = [HDConfig new];
    conf.port = 8888;
    conf.bonjourName = NSStringFromClass(self.class);
    conf.directory = NSHomeDirectory();
    HDAuthAccount *authAccount = [HDAuthAccount new];
    if (option) {
        option(conf, authAccount);
    }
    
    NSMutableDictionary* options = [NSMutableDictionary dictionary];
    options[GCDWebServerOption_Port] = @(conf.port);
    options[GCDWebServerOption_BonjourName] = conf.bonjourName;
    options[GCDWebHDServerOption_HDDirectory] = conf.directory;
    if (authAccount.count > 0) {
        options[GCDWebServerOption_AuthenticationAccounts] = [authAccount accounts];
        options[GCDWebServerOption_AuthenticationMethod] = GCDWebServerAuthenticationMethod_DigestAccess;
    }
    _runing = [_hdServer startWithOptions:options error:NULL];
}

- (void)stop {
    if (!_runing) return;
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
