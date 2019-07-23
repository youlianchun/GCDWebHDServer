//
//  FilePath.m
//  GCDWebHDServer_Example
//
//  Created by YLCHUN on 2019/7/23.
//  Copyright © 2019 YLCHUN. All rights reserved.
//

#import "FilePath.h"

@implementation FilePath
@synthesize name = _name, path = _path, isDirectory = _isDirectory, dir = _dir;

- (instancetype)initWithDir:(NSString *)dir name:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
        _dir = dir;
        _path = [_dir stringByAppendingPathComponent:_name];
        _isDirectory = isDirectory(_path);
    }
    return self;
}

static BOOL isDirectory(NSString *filePath) {
    NSError *error = nil;
    NSDictionary *attr = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:&error];
    if (error) return NO;
    return [[attr fileType] isEqualToString:NSFileTypeDirectory];
}

+ (NSMutableArray<FilePath *> *)contentsOfFilePathAtPath:(NSString *)path {
    NSMutableArray<FilePath *> *arr = [NSMutableArray array];
    NSError *error = nil;
    NSArray *array = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];
    if (error) return nil;
    
    for (NSString *name in array) {
        FilePath *filePath = [[self alloc] initWithDir:path name:name];
        [arr addObject:filePath];
    }
    
    [arr sortUsingComparator:^(FilePath *path1, FilePath *path2){
        if (path1.isDirectory && !path2.isDirectory) {
            return NSOrderedAscending;
        }
        else if (!path1.isDirectory && path2.isDirectory) {
            return NSOrderedDescending;
        }
        else {
            NSComparisonResult ret = [path1.name compare:path2.name];
            if (ret == NSOrderedSame) {
                return NSOrderedSame;
            }
            else if (ret == NSOrderedAscending) {
                return NSOrderedAscending;
            }
            else {
                return NSOrderedDescending;
            }
        }
    }];
    return arr;
}

@end

