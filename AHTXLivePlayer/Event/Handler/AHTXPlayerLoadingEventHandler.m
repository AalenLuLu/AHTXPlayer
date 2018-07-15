//
//  AHTXPlayerLoadingEventHandler.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/7/15.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayerLoadingEventHandler.h"
#import "AHTXPlayerEvent.h"
#import "AHTXPlayItem.h"

@implementation AHTXPlayerLoadingEventHandler

- (void)handleEvent:(AHTXPlayerEvent *)event item:(AHTXPlayItem *)item
{
	if(AHTXPlayerEventType_Loading == event.eventType)
	{
		item.isLoading = YES;
	}
	else if(AHTXPlayerEventType_Vod_Loading_End == event.eventType)
	{
		item.isLoading = NO;
	}
}

@end
