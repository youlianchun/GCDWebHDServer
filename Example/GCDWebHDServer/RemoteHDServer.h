//
//  RemoteHDServer.h
//  GCDWebHDServer
//
//  Created by YLCHUN on 2019/7/17.
//  Copyright © 2019 YLCHUN. All rights reserved.
//

#import "SingleObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface RemoteHDServer : SingleObject
@property (nonatomic, readonly) NSURL *url;
- (void)start;
- (void)startWithPort:(NSUInteger)port;
- (void)stop;

+ (instancetype)share;
@end

NS_ASSUME_NONNULL_END
