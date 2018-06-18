//
//  AHTXPlayerView.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/6/9.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayerView.h"
#import "AHTXPlayerCoverView.h"
#import "AHTXPlayerTopView.h"
#import "AHTXPlayerBottomView.h"

@interface AHTXPlayerView () <AHTXPlayerTopViewDelegate>

@end

@implementation AHTXPlayerView

- (instancetype)init
{
	return [self initWithFrame: CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
	if(self = [super initWithFrame:frame])
	{
		
	}
	return self;
}

#pragma mark - override

- (void)layoutSubviews
{
	[super layoutSubviews];
	self.topView.frame = CGRectMake(0, 0, self.bounds.size.width, [self.topView viewHeight]);
	self.bottomView.frame = CGRectMake(0, self.bounds.size.height - [self.bottomView viewHeight], self.bounds.size.width, [self.bottomView viewHeight]);
}

#pragma mark - AHTXPlayerTopViewDelegate

- (void)onBackButtonPressed
{
	
}

#pragma mark - lazy load

- (UIView<AHTXPlayerCoverView> *)coverView
{
	if(nil == _coverView)
	{
		
	}
	return _coverView;
}

- (UIView<AHTXPlayerTopView> *)topView
{
	if(nil == _topView)
	{
		_topView = [[AHTXPlayerTopView alloc] initWithFrame: CGRectMake(0, 0, self.bounds.size.width, 0)];
		((AHTXPlayerTopView *)_topView).delegate = self;
	}
	return _topView;
}

- (UIView<AHTXPlayerBottomView> *)bottomView
{
	if(nil == _bottomView)
	{
		_bottomView = [[AHTXPlayerBottomView alloc] initWithFrame: CGRectMake(0, 0, self.bounds.size.width, 0)];
	}
	return _bottomView;
}

- (UIButton<AHTXPlayerPlayButton> *)playButton
{
	if(nil == _playButton)
	{
		
	}
	return _playButton;
}

@end
