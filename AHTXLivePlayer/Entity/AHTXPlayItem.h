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
@class AHTXPlayItemProgress;

@interface AHTXPlayItem : NSObject <AHTXPlayerDelegate>

@property (weak, nonatomic) id<AHTXPlayItemDelegate> delegate;
@property (strong, readonly, nonatomic) UIView *liveView;
@property (strong, nonatomic) AHTXPlayer *player;
@property (copy, nonatomic) NSString *urlString;
@property (assign, nonatomic) BOOL pausing;
@property (assign, readonly, nonatomic) BOOL isPlaying;
@property (assign, nonatomic) BOOL isLoading;
@property (strong, readonly, nonatomic) AHTXPlayItemProgress *progress;//Live always 0

- (BOOL)isValidURL;
- (AHTXPlayType)playType;
- (AHTXPlayerType)playerType;

- (void)playWithCompletion: (void (^)(BOOL success, NSError *error))completion;
- (void)resumeWithCompletion: (void (^)(BOOL success, NSError *error))completion;
- (void)pause;
- (void)stop;
- (void)updateProgress;


/**
 * Subclass override to register event handlers
 */
- (void)registerEventHandlers;

@end
