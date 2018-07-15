//
//  AHTXPlayItem.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/21.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayItem.h"
#import "AHTXPlayItemProgress.h"
#import "AHTXPlayerAgent.h"
#import "AHTXPlayer.h"

@interface AHTXPlayItem ()

@property (weak, nonatomic) AHTXPlayerAgent *agent;
@property (strong, nonatomic) UIView *liveView;
@property (strong, nonatomic) AHTXPlayItemProgress *progress;

@end

@implementation AHTXPlayItem

- (instancetype)init
{
	if(self = [super init])
	{
		_agent = [AHTXPlayerAgent sharedInstance];
		[self registerEventHandlers];
	}
	return self;
}

#pragma mark - interface

- (BOOL)isValidURL
{
	return NO;
}

- (AHTXPlayType)playType
{
	return AHTXPlayType_None;
}

- (AHTXPlayerType)playerType
{
	return AHTXPlayerType_Unknown;
}

- (void)playWithCompletion:(void (^)(BOOL, NSError *))completion
{
	[_agent playWithItem: self completion:^(BOOL success, NSError *error) {
		if(success)
		{
			if(self.delegate && [self.delegate respondsToSelector: @selector(playItemDidPlay:)])
			{
				[self.delegate playItemDidPlay: self];
			}
		}
		if(completion)
		{
			completion(success, error);
		}
	}];
}

- (void)resumeWithCompletion:(void (^)(BOOL, NSError *))completion
{
	[_agent resumeWithItem: self completion:^(BOOL success, NSError *error) {
		if(success)
		{
			if(self.delegate && [self.delegate respondsToSelector: @selector(playItemDidPlay:)])
			{
				[self.delegate playItemDidPlay: self];
			}
		}
		if(completion)
		{
			completion(success, error);
		}
	}];
}

- (void)pause
{
	[_agent pauseWithItem: self];
	if(_delegate && [_delegate respondsToSelector: @selector(playItemDidPause:)])
	{
		[_delegate playItemDidPause: self];
	}
}

- (void)stop
{
	[_agent stopWithItem: self];
	if(_delegate && [_delegate respondsToSelector: @selector(playItemDidStop:)])
	{
		[_delegate playItemDidStop: self];
	}
}

- (void)updateProgress
{
	[_agent updateProgressWithPlayItem: self];
	if(_delegate && [_delegate respondsToSelector: @selector(playItem:didChangeProgress:)])
	{
		[_delegate playItem: self didChangeProgress: self.progress];
	}
}

- (BOOL)isPlaying
{
	return [_agent isPlayingWithItem: self];
}

- (void)setIsLoading:(BOOL)isLoading
{
	if(_isLoading != isLoading)
	{
		_isLoading = isLoading;
		if(_delegate && [_delegate respondsToSelector: @selector(playItem:didChangeLoading:)])
		{
			[_delegate playItem: self didChangeLoading: _isLoading];
		}
	}
}

- (void)registerEventHandlers
{
	
}

#pragma mark - AHTXPlayerDelegate

- (void)onAHTXPlayerEvent:(AHTXPlayerEvent *)event
{
	
}

#pragma mark - lazy load

- (UIView *)liveView
{
	if(nil == _liveView)
	{
		_liveView = [[UIView alloc] init];
	}
	return _liveView;
}

- (AHTXPlayItemProgress *)progress
{
	if(nil == _progress)
	{
		_progress = [[AHTXPlayItemProgress alloc] init];
		_progress.duration = 0;
		_progress.cachedDuration = 0;
		_progress.playbackTime = 0;
	}
	return _progress;
}

@end
