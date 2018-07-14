//
//  AHTXPlayerProgressEventBuilder.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/7/14.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayerProgressEventBuilder.h"
#import "AHTXPlayerEvent.h"
#import <TXLiveSDKTypeDef.h>

@implementation AHTXPlayerProgressEventBuilder

- (void)buildEvent:(AHTXPlayerEvent *)event params:(NSDictionary *)params
{
	[super buildEvent:event params:params];
	event.duration = [params[EVT_PLAY_DURATION] isKindOfClass: [NSString class]] ? params[EVT_PLAY_DURATION] : @"0";
	event.cachedDuration = [params[EVT_PLAYABLE_DURATION] isKindOfClass: [NSString class]] ? params[EVT_PLAYABLE_DURATION] : @"0";
	event.progress = [params[EVT_PLAY_PROGRESS] isKindOfClass: [NSString class]] ? params[EVT_PLAY_PROGRESS] : @"0";
}

@end
