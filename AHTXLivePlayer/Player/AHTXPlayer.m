//
//  AHTXPlayer.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/26.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayer.h"
#import "AHTXPlayItem.h"

@implementation AHTXPlayer

#pragma mark - interface

- (void)playWithItem:(AHTXPlayItem *)item completion:(void (^)(BOOL, NSError *))completion
{
	BOOL result = NO;
	NSError *error = nil;
	if(nil == item)
	{
		error = [NSError errorWithDomain: AHTXPlayerErrorDomain code: AHTXPlayerErrorDomain_MissingItem userInfo: nil];
	}
	else if(![item isValidURL])
	{
		error = [NSError errorWithDomain: AHTXPlayerErrorDomain code: AHTXPlayerErrorDomain_InvalidURL userInfo: nil];
	}
	else
	{
		result = YES;
	}
	if(completion)
	{
		completion(result, error);
	}
}

- (void)resumeWithItem:(AHTXPlayItem *)item completion:(void (^)(BOOL, NSError *))completion
{
	if(completion)
	{
		completion(NO, [NSError errorWithDomain: AHTXPlayerErrorDomain code: AHTXPlayerErrorDomain_Unknown userInfo: nil]);
	}
}

- (void)pauseWithItem:(AHTXPlayItem *)item
{
	
}

- (void)stopWithItem:(AHTXPlayItem *)item
{
	
}

- (void)seekWithItem:(AHTXPlayItem *)item time:(float)time completion:(void (^)(BOOL, NSError *))completion
{
	if(completion)
	{
		completion(NO, [NSError errorWithDomain: AHTXPlayerErrorDomain code: AHTXPlayerErrorDomain_Unsupport userInfo: nil]);
	}
}

@end
