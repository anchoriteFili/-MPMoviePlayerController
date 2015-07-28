//
//  ViewController.m
//  播放器测试
//
//  Created by lanou3g on 15-7-28.
//  Copyright (c) 2015年 hehehhe. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    loadingAni = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(140, 150, 37, 37)];
    loadingAni.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [self.view addSubview:loadingAni];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(130, 190, 80, 40)];
    label.text = @"加载中。。。";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    [loadingAni startAnimating];
    [self.view addSubview:label];
    
    
}

- (void)moviePlayerLoadStateChanged:(NSNotification *)notification {
    [loadingAni stopAnimating];
    [label removeFromSuperview];
    
    if ([mp loadState] != MPMovieLoadStateUnknown) {
        //移除观察者
        [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
        
//        设置横屏
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:NO];
        [self.view setBounds:CGRectMake(0, 0, 480, 320)];
        [self.view setCenter:CGPointMake(160, 240)];
        
//        选中当前view
        [self.view setTransform:CGAffineTransformMakeRotation(M_PI/2)];
        
//        设置moviePlayer的frame
        [mp.view setFrame:CGRectMake(0, 0, 480, 320)];
        
//        将moviePlayer添加到view中
        [self.view addSubview:mp.view];
        
//        播放
        [mp play];
        
    }
}

- (void)moviePlayBackDidFinish:(NSNotification *)notification {
//    还原状态栏为默认状态
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
//    移除观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    [self dismissModalViewControllerAnimated:NO];
    
}

- (void)readyPlayer {
    mp = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    
    if ([mp respondsToSelector:@selector(loadState)]) {
        [mp setControlStyle:MPMovieControlStyleFullscreen];
        
//        满屏
        [mp setFullscreen:YES];
//        有助于减少延迟
        [mp prepareToPlay];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)playMovie:(NSString *)fileName {
//    视频文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"mp4"];
//    视频url
    NSURL *url = [NSURL URLWithString:path];
//    视频播放对象
    
    
    
}



@end
