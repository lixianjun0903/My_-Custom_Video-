
#import <UIKit/UIKit.h>

//#import "VideoPlayerViewController.h"

@import MediaPlayer;

@protocol hiddenBar <NSObject>

-(void)hiddenBar;
-(void)displayBar;
@end



@interface KrVideoPlayerController : MPMoviePlayerController


//@property (retain ,nonatomic) VideoPlayerViewController *videoPlayer;
@property(nonatomic,assign)id<hiddenBar>myDelegate;
/** video.view 消失 */
@property (nonatomic, copy)void(^dimissCompleteBlock)(void);
/** 进入最小化状态 */
@property (nonatomic, copy)void(^willBackOrientationPortrait)(void);
/** 进入全屏状态 */
@property (nonatomic, copy)void(^willChangeToFullscreenMode)(void);
@property (nonatomic, assign) CGRect frame;

- (instancetype)initWithFrame:(CGRect)frame;
- (void)showInWindow;
- (void)dismiss;
/**
 *  获取视频截图
 */
+ (UIImage*) thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;
@end
