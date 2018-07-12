//
//  AHTXPlayItem.h
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/21.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AHTXPlayerDef.h"

@class AHTXPlayer;

@interface AHTXPlayItem : NSObject

@property (strong, readonly, nonatomic) UIView *liveView;
@property (strong, nonatomic) AHTXPlayer *player;
@property (copy, nonatomic) NSString *urlString;
@property (assign, nonatomic) NSTimeInterval currentPlaybackTime;//Live always 0
@property (assign, nonatomic) BOOL pausing;

- (BOOL)isValidURL;
- (AHTXPlayType)playType;
- (AHTXPlayerType)playerType;

- (void)playWithCompletion: (void (^)(BOOL success, NSError *error))completion;
- (void)resumeWithCompletion: (void (^)(BOOL success, NSError *error))completion;
- (void)pause;
- (void)stop;

@end
