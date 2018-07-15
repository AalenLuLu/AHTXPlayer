//
//  AHTXPlayerStartEventHandler.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/7/15.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayerStartEventHandler.h"
#import "AHTXPlayItem.h"

@implementation AHTXPlayerStartEventHandler

- (void)handleEvent:(AHTXPlayerEvent *)event item:(AHTXPlayItem *)item
{
	item.isLoading = NO;
}

@end
