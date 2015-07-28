//
//  ViewController.h
//  播放器测试
//
//  Created by lanou3g on 15-7-28.
//  Copyright (c) 2015年 hehehhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController {
    MPMoviePlayerController *mp;
    NSURL *movieURL; // 视频地址
    UIActivityIndicatorView *loadingAni; // 加载动画
    UILabel *label; // 加载提醒
}

@property (nonatomic,retain) NSURL *movieURL;

//准备播放
- (void)readyPlayer;


@end

