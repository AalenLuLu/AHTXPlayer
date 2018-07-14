//
//  AHTXPlayerEventBuilder.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/7/14.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayerEventBuilder.h"
#import "AHTXPlayerEvent.h"
#import <TXLiveSDKTypeDef.h>

@implementation AHTXPlayerEventBuilder

- (void)buildEvent:(AHTXPlayerEvent *)event params:(NSDictionary *)params
{
	event.msg = [params[EVT_MSG] isKindOfClass: [NSString class]] ? params[EVT_MSG] : nil;
	event.time = [params[EVT_TIME] isKindOfClass: [NSNumber class]] ? [params[EVT_TIME] doubleValue] : 0;
}

@end
