//
//  AHTXVodPlayItemFactory.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/22.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXVodPlayItemFactory.h"
#import "AHTXVodPlayItem.h"

@implementation AHTXVodPlayItemFactory

- (AHTXPlayItem *)createPlayItem
{
	return [[AHTXVodPlayItem alloc] init];
}

@end
