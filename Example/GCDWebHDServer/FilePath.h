//
//  FilePath.h
//  GCDWebHDServer_Example
//
//  Created by YLCHUN on 2019/7/23.
//  Copyright © 2019 YLCHUN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FilePath : NSObject
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *path;
@property (nonatomic, readonly) BOOL isDirectory;
@property (nonatomic, readonly) NSString *dir;

- (instancetype)initWithDir:(NSString *)dir name:(NSString *)name;

+ (NSMutableArray<FilePath *> *)contentsOfFilePathAtPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
