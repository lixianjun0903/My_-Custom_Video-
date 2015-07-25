//
//  ViewController.m
//  video
//
//  Created by on 15/7/23.
//  Copyright (c) 2015年 TH. All rights reserved.
//

#import "ViewController.h"
#import "KrVideoPlayerController.h"
#import "KrVideoPlayerControlView.h"
@interface ViewController ()


@property(nonatomic,strong)UIView * Play;
@property(nonatomic,strong)KrVideoPlayerController * videoController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self playVideo];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)playVideo{
    NSURL *url = [NSURL URLWithString:@"http://zqgbzx.cn:6060/zwapi/videos/ZQ0005.mp4"];
    [self addVideoPlayerWithURL:url];
}

- (void)addVideoPlayerWithURL:(NSURL *)url{
    if (!self.videoController) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        self.videoController = [[KrVideoPlayerController alloc] initWithFrame:CGRectMake(0, 64, width, width*(9.0/16.0))];
        __weak typeof(self)weakSelf = self;
        [self.videoController setDimissCompleteBlock:^{
            weakSelf.videoController = nil;
        }];
        [self.videoController setWillBackOrientationPortrait:^{
//            [weakSelf toolbarHidden:NO];
        }];
        [self.videoController setWillChangeToFullscreenMode:^{
//            [weakSelf toolbarHidden:YES];
        }];
        [self.view addSubview:self.videoController.view];
    }
    self.videoController.contentURL = url;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
