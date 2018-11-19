//
//  ViewController.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/20.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "ViewController.h"
#import "AHTXPlayItem.h"
#import "AHTXPlayItemProgress.h"
#import "AHTXVodPlayItemFactory.h"

@interface ViewController () <AHTXPlayItemDelegate>

@property (strong, nonatomic) UIButton *playButton;
@property (strong, nonatomic) UIButton *pauseButton;
@property (strong, nonatomic) UIButton *resumeButton;
@property (strong, nonatomic) AHTXPlayItem *playItem;
@property (strong, nonatomic) UIView *durationView;
@property (strong, nonatomic) UIView *cachedDurationView;
@property (strong, nonatomic) UIView *playbackView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self.view addSubview: self.playButton];
	[self.view addSubview: self.pauseButton];
	[self.view addSubview: self.resumeButton];
	[self.view addSubview: self.durationView];
	[self.view addSubview: self.cachedDurationView];
	[self.view addSubview: self.playbackView];
	
	AHTXPlayItemFactory *factory = [[AHTXVodPlayItemFactory alloc] init];
	_playItem = [factory playItemWithURLString: @""];
	_playItem.delegate = self;
	[self.view addSubview: _playItem.liveView];
	_playItem.liveView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 100.0);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)_onPlayButtonPressed
{
	[self _showToast: @"Play"];
	[_playItem playWithCompletion:^(BOOL success, NSError *error) {
		NSLog(@"play completion: %ld, %ld", (long)success, (long)self.playItem.isPlaying);
	}];
	dispatch_async(dispatch_get_main_queue(), ^{
		NSLog(@"async did invoke play: %ld", (long)self.playItem.isPlaying);
	});
}

- (void)_onPauseButtonPressed
{
	[self _showToast: @"Pause"];
	[_playItem pause];
}

- (void)_onResumeButtonPressed
{
	[self _showToast: @"Resume"];
	[_playItem resumeWithCompletion:^(BOOL success, NSError *error) {
		NSLog(@"%ld", (long)success);
	}];
}

- (void)_showToast: (NSString *)message
{
	UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake((self.view.bounds.size.width - 200.0) * 0.5, (self.view.bounds.size.height - 44.0) * 0.5, 200.0, 44.0)];
	label.font = [UIFont systemFontOfSize: 14.0];
	label.textColor = [UIColor whiteColor];
	label.text = message;
	label.textAlignment = NSTextAlignmentCenter;
	label.backgroundColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.6];
	[self.view addSubview: label];
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[label removeFromSuperview];
	});
}

- (void)playItem: (AHTXPlayItem *)item didChangeProgress: (AHTXPlayItemProgress *)progress
{
	CGFloat scale = progress.cachedDuration / progress.duration;
	CGRect cachedFrame = self.cachedDurationView.frame;
	cachedFrame.size.width = self.view.bounds.size.width * scale;
	self.cachedDurationView.frame = cachedFrame;
	CGFloat x = self.view.bounds.size.width * (progress.playbackTime / progress.duration);
	CGRect playbackFrame = self.playbackView.frame;
	playbackFrame.origin.x = x;
	self.playbackView.frame = playbackFrame;
}

- (UIButton *)playButton
{
	if(nil == _playButton)
	{
		_playButton = [[UIButton alloc] initWithFrame: CGRectMake(0, self.view.bounds.size.height - 44.0 - 20.0, 100.0, 44.0)];
		[_playButton setTitle: @"Play" forState: UIControlStateNormal];
		[_playButton setTitleColor: self.view.tintColor forState: UIControlStateNormal];
		[_playButton addTarget: self action: @selector(_onPlayButtonPressed) forControlEvents: UIControlEventTouchUpInside];
	}
	return _playButton;
}

- (UIButton *)pauseButton
{
	if(nil == _pauseButton)
	{
		_pauseButton = [[UIButton alloc] initWithFrame: CGRectMake(100.0, self.view.bounds.size.height - 44.0 - 20.0, 100.0, 44.0)];
		[_pauseButton setTitle: @"Pause" forState: UIControlStateNormal];
		[_pauseButton setTitleColor: self.view.tintColor forState: UIControlStateNormal];
		[_pauseButton addTarget: self action: @selector(_onPauseButtonPressed) forControlEvents: UIControlEventTouchUpInside];
	}
	return _pauseButton;
}

- (UIButton *)resumeButton
{
	if(nil == _resumeButton)
	{
		_resumeButton = [[UIButton alloc] initWithFrame: CGRectMake(200.0, self.view.bounds.size.height - 44.0 - 20.0, 100.0, 44.0)];
		[_resumeButton setTitle: @"Resume" forState: UIControlStateNormal];
		[_resumeButton setTitleColor: self.view.tintColor forState: UIControlStateNormal];
		[_resumeButton addTarget: self action: @selector(_onResumeButtonPressed) forControlEvents: UIControlEventTouchUpInside];
	}
	return _resumeButton;
}

- (UIView *)durationView
{
	if(nil == _durationView)
	{
		_durationView = [[UIView alloc] initWithFrame: CGRectMake(0, self.view.bounds.size.height - 10.0, self.view.bounds.size.width, 5.0)];
		_durationView.backgroundColor = [UIColor blackColor];
	}
	return _durationView;
}

- (UIView *)cachedDurationView
{
	if(nil == _cachedDurationView)
	{
		_cachedDurationView = [[UIView alloc] initWithFrame: CGRectMake(0, self.view.bounds.size.height - 10.0, 0, 5.0)];
		_cachedDurationView.backgroundColor = [UIColor grayColor];
	}
	return _cachedDurationView;
}

- (UIView *)playbackView
{
	if(nil == _playbackView)
	{
		_playbackView = [[UIView alloc] initWithFrame: CGRectMake(0, self.view.bounds.size.height - 10.0, 5.0, 5.0)];
		_playbackView.backgroundColor = [UIColor redColor];
	}
	return _playbackView;
}

@end
