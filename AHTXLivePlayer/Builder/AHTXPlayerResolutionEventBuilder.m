//
//  AHTXPlayerResolutionEventBuilder.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/7/14.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayerResolutionEventBuilder.h"
#import "AHTXPlayerEvent.h"
#import <TXLiveSDKTypeDef.h>

@implementation AHTXPlayerResolutionEventBuilder

- (void)buildEvent:(AHTXPlayerEvent *)event params:(NSDictionary *)params
{
	[super buildEvent:event params:params];
	if([params[EVT_PARAM1] isKindOfClass: [NSNumber class]] && [params[EVT_PARAM2] isKindOfClass: [NSNumber class]])
	{
		event.resolution = CGSizeMake([params[EVT_PARAM1] floatValue], [params[EVT_PARAM2] floatValue]);
	}
	else
	{
		event.resolution = CGSizeZero;
	}
}

@end
