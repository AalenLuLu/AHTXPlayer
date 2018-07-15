//
//  AHTXLivePlayItem.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/20.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXLivePlayItem.h"
#import "AHTXPlayerEvent.h"

@implementation AHTXLivePlayItem

- (AHTXPlayType)playType
{
	AHTXPlayType type = AHTXPlayType_None;
	if([self.urlString hasPrefix: @"rtmp://"])//RTMP ACC 为连麦
	{
		type = self.accelerate ? AHTXPlayType_RTMP_ACC : AHTXPlayType_RTMP;
	}
	else
	{
		NSRange range = [self.urlString rangeOfString: @".flv"];
		if(NSNotFound != range.location)
		{
			type = AHTXPlayType_FLV;
		}
	}
	return type;
}

- (AHTXPlayerType)playerType
{
	return AHTXPlayerType_Live;
}

- (BOOL)isValidURL
{
	AHTXPlayType type = [self playType];
	if(AHTXPlayType_None == type || [self.urlString hasPrefix: @"file://"])
	{
		return NO;
	}
	return YES;
}

#pragma mark - AHTXPlayerDelegate

- (void)onAHTXPlayerEvent:(AHTXPlayerEvent *)event
{
	NSLog(@"%@", @(event.eventType));
}

@end
