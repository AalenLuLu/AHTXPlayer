//
//  AHTXPlayerAgent.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/21.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayerAgent.h"
#import "AHTXLivePlayer.h"
#import "AHTXVodPlayer.h"
#import "AHTXPlayItem.h"

static AHTXPlayerAgent *sharedInstance = nil;

@interface AHTXPlayerAgent ()

//@property (strong, nonatomic) AHTXLivePlayer *livePlayer;
//@property (strong, nonatomic) AHTXVodPlayer *vodPlayer;
@property (strong, nonatomic) AHTXPlayItem *currentItem;

@end

@implementation AHTXPlayerAgent

+ (instancetype)sharedInstance
{
	if(nil == sharedInstance)
	{
		@synchronized(self)
		{
			if(nil == sharedInstance)
			{
				sharedInstance = [[super allocWithZone: nil] init];
			}
		}
	}
	return sharedInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
	return [self sharedInstance];
}

- (instancetype)init
{
	if(self = [super init])
	{
//		_livePlayer = [[AHTXLivePlayer alloc] init];
//		_vodPlayer = [[AHTXVodPlayer alloc] init];
	}
	return self;
}

#pragma mark - interface

- (void)playWithItem:(AHTXPlayItem *)item completion:(void (^)(BOOL, NSError *))completion
{
	AHTXPlayer *currentPlayer = _currentItem.player;//[self _playerForItem: _currentItem];
	AHTXPlayer *targetPlayer = item.player;//[self _playerForItem: item];
	if(![currentPlayer isEqual: targetPlayer])
	{
		[currentPlayer pauseWithItem: _currentItem];
	}
	if(nil == targetPlayer)
	{
		if(completion)
		{
			completion(NO, [NSError errorWithDomain: AHTXPlayerErrorDomain code: AHTXPlayerErrorDomain_Unknown userInfo: nil]);
		}
		return;
	}
	[targetPlayer playWithItem: item completion:^(BOOL success, NSError *error) {
		if(success)
		{
			self.currentItem = item;
		}
		if(completion)
		{
			completion(success, error);
		}
	}];
}

- (void)resumeWithItem:(AHTXPlayItem *)item completion:(void (^)(BOOL, NSError *))completion
{
	AHTXPlayer *currentPlayer = _currentItem.player;//[self _playerForItem: _currentItem];
	AHTXPlayer *targetPlayer = item.player;//[self _playerForItem: item];
	if(![currentPlayer isEqual: targetPlayer])
	{
		[currentPlayer pauseWithItem: _currentItem];
	}
	[targetPlayer resumeWithItem: item completion:^(BOOL success, NSError *error) {
		if(success)
		{
			self.currentItem = item;
		}
		if(completion)
		{
			completion(success, error);
		}
	}];
}

- (void)pauseWithItem:(AHTXPlayItem *)item
{
	AHTXPlayer *targetPlayer = item.player;//[self _playerForItem: item];
	[targetPlayer pauseWithItem: item];
}

- (void)stopWithItem:(AHTXPlayItem *)item
{
	AHTXPlayer *targetPlayer = item.player;//[self _playerForItem: item];
	[targetPlayer stopWithItem: item];
}

- (void)seekWithItem:(AHTXPlayItem *)item time:(float)time completion:(void (^)(BOOL, NSError *))completion
{
	AHTXPlayer *targetPlayer = item.player;//[self _playerForItem: item];
	[targetPlayer seekWithItem: item time: time completion: completion];
}

- (BOOL)isPlayingWithItem:(AHTXPlayItem *)item
{
	return [item.player isPlayingWithItem: item];
}

- (void)updateProgressWithPlayItem:(AHTXPlayItem *)item
{
	[item.player updateProgressWithPlayItem: item];
}

#pragma mark - private function

/*
- (AHTXPlayer *)_playerForItem: (AHTXPlayItem *)item
{
	AHTXPlayer *player = nil;
	if(AHTXPlayerType_Live == [item playerType])
	{
		player = _livePlayer;
	}
	else if(AHTXPlayerType_Vod == [item playerType])
	{
		player = _vodPlayer;
	}
	return player;
}
*/

@end
