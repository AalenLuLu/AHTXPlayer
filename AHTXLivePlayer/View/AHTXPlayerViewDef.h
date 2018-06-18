//
//  AHTXPlayerViewDef.h
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/6/10.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#ifndef AHTXPlayerViewDef_h
#define AHTXPlayerViewDef_h

@protocol AHTXPlayerCoverView <NSObject>

@end

@protocol AHTXPlayerTopView <NSObject>

- (CGFloat)viewHeight;

@end

@protocol AHTXPlayerBottomView <NSObject>

- (void)onPlayStateChanged;
- (void)onProgressChanged: (CGFloat)progress;
- (CGFloat)viewHeight;

@end

@protocol AHTXPlayerPlayButton <NSObject>

@end

#endif /* AHTXPlayerViewDef_h */
