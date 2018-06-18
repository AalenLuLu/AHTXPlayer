//
//  AHTXPlayItemFactory.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/22.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayItemFactory.h"
#import "AHTXPlayItem.h"

@implementation AHTXPlayItemFactory

- (AHTXPlayItem *)playItemWithURLString:(NSString *)urlString
{
	AHTXPlayItem *item = [self createPlayItem];
	item.urlString = urlString;
	return item;
}

- (AHTXPlayItem *)createPlayItem
{
	return nil;
}

@end
