//
//  FileExplorerController.m
//  GCDWebHDServer_Example
//
//  Created by YLCHUN on 2019/7/23.
//  Copyright © 2019 YLCHUN. All rights reserved.
//

#import "FileExplorerController.h"
#import "FilePath.h"

@interface FileExplorerController ()
@property (nonatomic, strong) NSString *dirpath;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation FileExplorerController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.dirpath == nil) {
        self.dirpath = NSHomeDirectory();
    }
    self.dataArray = [FilePath contentsOfFilePathAtPath:self.dirpath];
    // Do any additional setup after loading the view from its nib.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
