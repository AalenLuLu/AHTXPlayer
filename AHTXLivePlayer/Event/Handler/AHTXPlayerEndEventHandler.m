//
//  AHTXPlayerEndEventHandler.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/7/15.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayerEndEventHandler.h"
#import "AHTXPlayItem.h"

@implementation AHTXPlayerEndEventHandler

- (void)handleEvent:(AHTXPlayerEvent *)event item:(AHTXPlayItem *)item
{
	[item stop];
}

@end
