//
//  AHTXPlayerView.h
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/6/9.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AHTXPlayerViewDef.h"

@protocol AHTXPlayerViewDelegate <NSObject>

@end

@interface AHTXPlayerView : UIView

@property (strong, nonatomic) UIView<AHTXPlayerCoverView> *coverView;
@property (strong, nonatomic) UIView<AHTXPlayerTopView> *topView;
@property (strong, nonatomic) UIView<AHTXPlayerBottomView> *bottomView;
@property (strong, nonatomic) UIButton<AHTXPlayerPlayButton> *playButton;

@end
