//
//  ViewController.m
//  GCDWebHDServer
//
//  Created by YLCHUN on 2019/7/17.
//  Copyright © 2019 YLCHUN. All rights reserved.
//

#import "ViewController.h"
#import "RemoteHDServer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[RemoteHDServer share] start];
    NSLog(@"RemoteHDServer url: %@", [RemoteHDServer share].url.absoluteString);
    // Do any additional setup after loading the view.
}


@end
