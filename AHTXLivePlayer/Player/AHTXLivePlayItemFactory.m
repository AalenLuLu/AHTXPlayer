//
//  AHTXLivePlayItemFactory.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/22.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXLivePlayItemFactory.h"
#import "AHTXLivePlayItem.h"
#import "AHTXLivePlayer.h"

@implementation AHTXLivePlayItemFactory

- (AHTXPlayItem *)createPlayItem
{
	AHTXLivePlayItem *item = [[AHTXLivePlayItem alloc] init];
	item.player = [[AHTXLivePlayer alloc] init];
	item.player.delegate = item;
	return item;
}

@end
