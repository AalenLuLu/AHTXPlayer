//
//  AHTXPlayerBottomView.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/6/10.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayerBottomView.h"

@interface AHTXPlayerBottomView ()

@property (strong, nonatomic) UIButton *playButton;
@property (strong, nonatomic) UILabel *progressLabel;
@property (strong, nonatomic) UIProgressView *progressView;
@property (strong, nonatomic) UIButton *screenModeSwitchButton;

@end

@implementation AHTXPlayerBottomView

#pragma mark - interface

- (void)onPlayStateChanged
{
	
}

- (void)onProgressChanged:(CGFloat)progress
{
	
}

- (CGFloat)viewHeight
{
	return 50.0;
}

#pragma mark - override

- (void)layoutSubviews
{
	[super layoutSubviews];
}

#pragma mark - private function



#pragma mark - lazy load

- (UIButton *)playButton
{
	if(nil == _playButton)
	{
		
	}
	return _playButton;
}

- (UILabel *)progressLabel
{
	if(nil == _progressLabel)
	{
		
	}
	return _progressLabel;
}

- (UIProgressView *)progressView
{
	if(nil == _progressView)
	{
		
	}
	return _progressView;
}

- (UIButton *)screenModeSwitchButton
{
	if(nil == _screenModeSwitchButton)
	{
		
	}
	return _screenModeSwitchButton;
}

@end
