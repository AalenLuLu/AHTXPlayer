//
//  AHTXPlayItem.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/21.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayItem.h"
#import "AHTXPlayerAgent.h"
#import "AHTXPlayer.h"

@interface AHTXPlayItem ()

@property (weak, nonatomic) AHTXPlayerAgent *agent;
@property (strong, nonatomic) UIView *liveView;

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
	[_agent playWithItem: self completion: completion];
}

- (void)resumeWithCompletion:(void (^)(BOOL, NSError *))completion
{
	[_agent resumeWithItem: self completion: completion];
}

- (void)pause
{
	[_agent pauseWithItem: self];
}

- (void)stop
{
	[_agent stopWithItem: self];
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

@end
