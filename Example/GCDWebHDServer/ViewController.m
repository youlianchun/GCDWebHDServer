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
@property (weak, nonatomic) IBOutlet UILabel *spaceLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.spaceLabel.text = [NSString stringWithFormat:@"%0.2lf MB",RemoteHDServer.space/1024.0/1024.0];
    
    
    // Do any additional setup after loading the view.
}

- (IBAction)switchAction:(UISwitch *)sender {
    if (sender.on) {
        [[RemoteHDServer share] startWithOption:^(HDConfig * _Nonnull conf, HDAuthAccount * _Nonnull auth) {
            conf.port = 8888;
            auth[@"YLCHUN"] = @"111111";
        }];
        self.urlLabel.text = [RemoteHDServer share].url.absoluteString;
    }else {
        [[RemoteHDServer share] stop];
        self.urlLabel.text = @"";
    }
}

@end
