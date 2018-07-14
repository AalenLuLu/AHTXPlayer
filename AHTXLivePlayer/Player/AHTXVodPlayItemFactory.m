//
//  AHTXVodPlayItemFactory.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/22.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXVodPlayItemFactory.h"
#import "AHTXVodPlayItem.h"
#import "AHTXVodPlayer.h"

@implementation AHTXVodPlayItemFactory

- (AHTXPlayItem *)createPlayItem
{
	AHTXVodPlayItem *item = [[AHTXVodPlayItem alloc] init];
	item.player = [[AHTXVodPlayer alloc] init];
	item.player.delegate = item;
	return item;
}

@end
