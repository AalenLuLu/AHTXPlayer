//
//  AHTXLivePlayer.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/20.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXLivePlayer.h"
#import "AHTXPlayItem.h"
#import "AHTXPlayerEvent.h"
#import <TXLivePlayer.h>

@interface AHTXLivePlayer () <TXLivePlayListener>

@property (strong, nonatomic) TXLivePlayer *player;

@end

@implementation AHTXLivePlayer

- (void)dealloc
{
	[self stopWithItem: self.item];
	[_player removeVideoWidget];
}

- (instancetype)init
{
	if(self = [super init])
	{
		_player = [[TXLivePlayer alloc] init];
		_player.delegate = self;
#if !TARGET_IPHONE_SIMULATOR
		_player.enableHWAcceleration = YES;
#endif
	}
	return self;
}

#pragma mark - interface

- (void)playWithItem:(AHTXPlayItem *)item completion:(void (^)(BOOL, NSError *))completion
{
	__weak __typeof__(self) weakSelf = self;
	[super playWithItem: item completion: ^(BOOL success, NSError *error) {
		__strong __typeof__(weakSelf) strongSelf = weakSelf;
		BOOL result = NO;
		if(success)
		{
			[strongSelf stopWithItem: strongSelf.item];
			[strongSelf.player setupVideoWidget: CGRectZero containView: item.liveView insertIndex: 0];
			int ret = [strongSelf.player startPlay: item.urlString type: [strongSelf typeWithItem: item]];
			result = (0 == ret);
			if(!result)
			{
				error = [NSError errorWithDomain: AHTXPlayerErrorDomain code: AHTXPlayerErrorDomain_StartPlayError userInfo: @{AHTXPlayerErrorUserInfoItemKey: item}];
			}
			else
			{
				strongSelf.item = item;
			}
		}
		if(completion)
		{
			completion(result, error);
		}
	}];
}

- (void)resumeWithItem:(AHTXPlayItem *)item completion:(void (^)(BOOL, NSError *))completion
{
	if([self.item isEqual: item] && item.pausing)
	{
		[_player resume];
		item.pausing = NO;
		if(completion)
		{
			completion(YES, nil);
		}
	}
	else
	{
		[self playWithItem: item completion: completion];
	}
}

- (void)pauseWithItem:(AHTXPlayItem *)item
{
	if([self.item isEqual: item])
	{
		/*
		if([_player isPlaying])
		{
			[_player pause];
			item.pausing = YES;
		}
		else
		{
			[self stopWithItem: item];
		}
		*/
		[_player pause];
		item.pausing = YES;
	}
}

- (void)stopWithItem:(AHTXPlayItem *)item
{
	if([self.item isEqual: item])
	{
		[_player stopPlay];
		item.pausing = NO;
	}
}

- (void)setUseSpeaker:(BOOL)useSpeaker
{
	[TXLivePlayer setAudioRoute: useSpeaker ? AUDIO_ROUTE_SPEAKER : AUDIO_ROUTE_RECEIVER];
}

- (BOOL)isPlayingWithItem:(AHTXPlayItem *)item
{
	if([self.item isEqual: item])
	{
		return _player.isPlaying;
	}
	return NO;
}

#pragma mark - private function

- (TX_Enum_PlayType)typeWithItem: (AHTXPlayItem *)item
{
	TX_Enum_PlayType type = PLAY_TYPE_LOCAL_VIDEO;
	AHTXPlayType playType = [item playType];
	switch(playType)
	{
		case AHTXPlayType_FLV:
			type = PLAY_TYPE_LIVE_FLV;
			break;
		case AHTXPlayType_RTMP:
			type = PLAY_TYPE_LIVE_RTMP;
			break;
		case AHTXPlayType_RTMP_ACC:
			type = PLAY_TYPE_LIVE_RTMP_ACC;
			break;
		default:
			break;
	}
	return type;
}

#pragma mark - TXLivePlayListener

- (void)onPlayEvent:(int)EvtID withParam:(NSDictionary *)param
{
	if(self.delegate && [self.delegate respondsToSelector: @selector(onAHTXPlayerEvent:)])
	{
		[self.delegate onAHTXPlayerEvent: [[AHTXPlayerEvent alloc] initWithEventID:EvtID params:param]];
	}
}

- (void)onNetStatus:(NSDictionary *)param
{
	
}

#pragma mark - lazy load

@end
