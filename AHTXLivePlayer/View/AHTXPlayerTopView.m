//
//  AHTXPlayerTopView.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/6/10.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayerTopView.h"

@interface AHTXPlayerTopView ()

@property (strong, nonatomic) UIButton *backButton;

@end

@implementation AHTXPlayerTopView

#pragma mark - interface

- (CGFloat)viewHeight
{
	return 50.0;
}

#pragma mark - private function

- (void)_onBackButtonPressed
{
	if(_delegate && [_delegate respondsToSelector: @selector(onBackButtonPressed)])
	{
		[_delegate onBackButtonPressed];
	}
}

#pragma mark - override

- (void)layoutSubviews
{
	[super layoutSubviews];
	CGRect backButtonFrame = self.backButton.frame;
	backButtonFrame.origin = CGPointMake(16.0, (self.bounds.size.height - backButtonFrame.size.height) * 0.5);
	self.backButton.frame = backButtonFrame;
}

#pragma mark - lazy load

- (UIButton *)backButton
{
	if(nil == _backButton)
	{
		_backButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 44.0, 44.0)];
		[_backButton setTitle: @"<" forState: UIControlStateNormal];
		[_backButton setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
		[_backButton addTarget: self action: @selector(_onBackButtonPressed) forControlEvents: UIControlEventTouchUpInside];
	}
	return _backButton;
}

@end
