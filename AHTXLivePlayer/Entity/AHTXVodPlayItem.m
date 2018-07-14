//
//  AHTXVodPlayItem.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/20.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXVodPlayItem.h"
#import "AHTXPlayerEvent.h"
#import "AHTXPlayerEndEventHandler.h"

@interface AHTXVodPlayItem ()

@property (strong, nonatomic) NSDictionary<NSNumber *, AHTXPlayerEventHandler *> *eventHandlers;

@end

@implementation AHTXVodPlayItem

- (AHTXPlayType)playType
{
	AHTXPlayType type = AHTXPlayType_None;
	NSRange flvRange = [self.urlString rangeOfString: @".flv"];
	NSRange mp4Range = [self.urlString rangeOfString: @".mp4"];
	NSRange m3u8Range = [self.urlString rangeOfString: @".m3u8"];
	if([self.urlString hasPrefix: @"file://"])
	{
		type = AHTXPlayType_Local;
	}
	else if(NSNotFound != flvRange.location)
	{
		type = AHTXPlayType_FLV;
	}
	else if(NSNotFound != mp4Range.location)
	{
		type = AHTXPlayType_MP4;
	}
	else if(NSNotFound != m3u8Range.location)
	{
		type = AHTXPlayType_HLS;
	}
	return type;
}

- (AHTXPlayerType)playerType
{
	return AHTXPlayerType_Vod;
}

- (BOOL)isValidURL
{
	AHTXPlayType type = [self playType];
	if(AHTXPlayType_None == type || [self.urlString hasPrefix: @"rtmp://"])
	{
		return NO;
	}
	return YES;
}

- (void)registerEventHandlers
{
	_eventHandlers = @{@(AHTXPlayerEventType_End): [[AHTXPlayerEndEventHandler alloc] init]};
}

#pragma mark - private function



#pragma mark - AHTXPlayerDelegate

- (void)onAHTXPlayerEvent:(AHTXPlayerEvent *)event
{
	NSLog(@"%@", @(event.eventType));
	AHTXPlayerEventHandler *handler = _eventHandlers[@(event.eventType)];
	[handler handleEvent: event item: self];
}

@end
