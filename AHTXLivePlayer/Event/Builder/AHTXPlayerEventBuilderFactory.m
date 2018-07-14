//
//  AHTXPlayerEventBuilderFactory.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/7/14.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayerEventBuilderFactory.h"
#import "AHTXPlayerProgressEventBuilder.h"
#import "AHTXPlayerResolutionEventBuilder.h"

@implementation AHTXPlayerEventBuilderFactory

+ (AHTXPlayerEventBuilder *)builderForEventType:(AHTXPlayerEventType)eventType
{
	AHTXPlayerEventBuilder *builder = nil;
	switch (eventType) {
		case AHTXPlayerEventType_Progress:
			builder = [[AHTXPlayerProgressEventBuilder alloc] init];
			break;
		case AHTXPlayerEventType_ResolutionChange:
			builder = [[AHTXPlayerResolutionEventBuilder alloc] init];
			break;
		default:
			builder = [[AHTXPlayerEventBuilder alloc] init];
			break;
	}
	return builder;
}

@end
