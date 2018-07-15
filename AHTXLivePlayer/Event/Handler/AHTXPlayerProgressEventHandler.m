//
//  AHTXPlayerProgressEventHandler.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/7/15.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayerProgressEventHandler.h"
#import "AHTXPlayItem.h"

@implementation AHTXPlayerProgressEventHandler

- (void)handleEvent:(AHTXPlayerEvent *)event item:(AHTXPlayItem *)item
{
	[item updateProgress];
}

@end
