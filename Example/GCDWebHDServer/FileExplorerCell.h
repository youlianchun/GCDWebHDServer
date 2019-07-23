//
//  FileExplorerCell.h
//  GCDWebHDServer_Example
//
//  Created by YLCHUN on 2019/7/23.
//  Copyright © 2019 YLCHUN. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FilePath;
NS_ASSUME_NONNULL_BEGIN

@interface FileExplorerCell : UICollectionViewCell
@property (nonatomic, strong) FilePath *filePath;
@end

NS_ASSUME_NONNULL_END
