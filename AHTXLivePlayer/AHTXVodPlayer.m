//
//  AHTXVodPlayer.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/20.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXVodPlayer.h"
#import "AHTXPlayItem.h"
#import <TXVodPlayer.h>

@interface AHTXVodPlayer () <TXVodPlayListener>

@property (strong, nonatomic) TXVodPlayer *player;

@end

@implementation AHTXVodPlayer

- (void)dealloc
{
	[self stopWithItem: self.item];
	[_player removeVideoWidget];
}

- (instancetype)init
{
	if(self = [super init])
	{
		_player = [[TXVodPlayer alloc] init];
		_player.vodDelegate = self;
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
			[strongSelf.player setupVideoWidget: item.liveView insertIndex: 0];
			int ret = [strongSelf.player startPlay: item.urlString];
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
		if([_player isPlaying])
		{
			[_player pause];
			item.pausing = YES;
		}
		else
		{
			[self stopWithItem: item];
		}
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

- (void)seekWithItem:(AHTXPlayItem *)item time:(float)time completion:(void (^)(BOOL, NSError *))completion
{
	if([self.item isEqual: item])
	{
		BOOL result = NO;
		NSError *error = nil;
		int ret = [_player seek: time];
		result = (0 == ret);
		if(!result)
		{
			NSInteger code = AHTXPlayerErrorDomain_Seek;
			NSDictionary *userInfo = nil;
			if(nil == item)
			{
				code = AHTXPlayerErrorDomain_MissingItem;
			}
			else
			{
				userInfo = @{AHTXPlayerErrorUserInfoItemKey: item};
			}
			error = [NSError errorWithDomain: AHTXPlayerErrorDomain code: code userInfo: userInfo];
		}
		if(completion)
		{
			completion(result, error);
		}
	}
	else
	{
		if(completion)
		{
			completion(NO, [NSError errorWithDomain: AHTXPlayerErrorDomain code: AHTXPlayerErrorDomain_NotPlayingItem userInfo: nil]);
		}
	}
}

#pragma mark - TXVodPlayListener

- (void)onPlayEvent:(TXVodPlayer *)player event:(int)EvtID withParam:(NSDictionary *)param
{
	NSLog(@"------------------------------------------------------------");
	NSLog(@"%@", param);
	NSLog(@"------------------------------------------------------------");
}

- (void)onNetStatus:(TXVodPlayer *)player withParam:(NSDictionary *)param
{
	
}

#pragma mark - lazy load

@end
