//
//  ViewController.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/20.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "ViewController.h"
#import "AHTXPlayItem.h"
#import "AHTXVodPlayItemFactory.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton *playButton;
@property (strong, nonatomic) AHTXPlayItem *playItem;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self.view addSubview: self.playButton];
	
	AHTXPlayItemFactory *factory = [[AHTXVodPlayItemFactory alloc] init];
	_playItem = [factory playItemWithURLString: @"https://1251962819.vod2.myqcloud.com/54067453vodtransgzp1251962819/26bc1bf57447398156931439625/v.f20.mp4"];
	[self.view addSubview: _playItem.liveView];
	_playItem.liveView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 100.0);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)_onPlayButtonPressed
{
	[_playItem playWithCompletion:^(BOOL success, NSError *error) {
		NSLog(@"%ld", (long)success);
	}];
}

- (UIButton *)playButton
{
	if(nil == _playButton)
	{
		_playButton = [[UIButton alloc] initWithFrame: CGRectMake((self.view.bounds.size.width - 100) * 0.5, self.view.bounds.size.height - 44.0 - 20.0, 100.0, 44.0)];
		[_playButton setTitle: @"Play" forState: UIControlStateNormal];
		[_playButton setTitleColor: self.view.tintColor forState: UIControlStateNormal];
		[_playButton addTarget: self action: @selector(_onPlayButtonPressed) forControlEvents: UIControlEventTouchUpInside];
	}
	return _playButton;
}

@end
