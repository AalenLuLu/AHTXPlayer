//
//  AHTXPlayerTopView.h
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/6/10.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayerView.h"
#import "AHTXPlayerViewDef.h"

@protocol AHTXPlayerTopViewDelegate <NSObject>

- (void)onBackButtonPressed;

@end

@interface AHTXPlayerTopView : UIView <AHTXPlayerTopView>

@property (weak, nonatomic) id<AHTXPlayerTopViewDelegate> delegate;

@end
