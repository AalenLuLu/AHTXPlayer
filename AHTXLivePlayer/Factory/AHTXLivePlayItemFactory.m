//
//  AHTXLivePlayItemFactory.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/22.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXLivePlayItemFactory.h"
#import "AHTXLivePlayItem.h"

@implementation AHTXLivePlayItemFactory

- (AHTXPlayItem *)createPlayItem
{
	return [[AHTXLivePlayItem alloc] init];
}

@end
