//
//  AHTXPlayerDef.h
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/21.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const AHTXPlayerErrorDomain;
extern NSString * const AHTXPlayerErrorUserInfoItemKey;

NS_ERROR_ENUM(AHTXPlayerErrorDomain)
{
	AHTXPlayerErrorDomain_Unknown = -1,
	AHTXPlayerErrorDomain_Unsupport = -2,
	AHTXPlayerErrorDomain_MissingItem = -1000,
	AHTXPlayerErrorDomain_InvalidURL = -1001,
	AHTXPlayerErrorDomain_StartPlayError = -1002,
	AHTXPlayerErrorDomain_NotPlayingItem = -1003,
	AHTXPlayerErrorDomain_Seek = -1004,
};

typedef NS_ENUM(NSUInteger, AHTXPlayerDisplayType) {
	AHTXPlayerDisplayType_Normal = 0,
	AHTXPlayerDisplayType_FullScreen,
	AHTXPlayerDisplayType_Flow,
};

typedef NS_ENUM(NSUInteger, AHTXPlayType) {
	AHTXPlayType_None = 0,
	AHTXPlayType_RTMP,
	AHTXPlayType_FLV,
	AHTXPlayType_MP4,
	AHTXPlayType_HLS,
	AHTXPlayType_RTMP_ACC,
	AHTXPlayType_Local
};

typedef NS_ENUM(NSUInteger, AHTXPlayerType) {
	AHTXPlayerType_Unknown,
	AHTXPlayerType_Live,
	AHTXPlayerType_Vod,
};

@class AHTXPlayItem;

@protocol AHTXPlayer <NSObject>

- (void)playWithItem: (AHTXPlayItem *)item completion: (void (^)(BOOL success, NSError *error))completion;
- (void)resumeWithItem: (AHTXPlayItem *)item completion: (void (^)(BOOL success, NSError *error))completion;
- (void)pauseWithItem: (AHTXPlayItem *)item;
- (void)stopWithItem: (AHTXPlayItem *)item;
- (void)seekWithItem: (AHTXPlayItem *)item time: (float)time completion: (void (^)(BOOL success, NSError *error))completion;

@end

/*
PLAY_TYPE_LIVE_RTMP = 0,          //RTMP直播
PLAY_TYPE_LIVE_FLV,               //FLV直播
PLAY_TYPE_VOD_FLV,                //FLV点播
PLAY_TYPE_VOD_HLS,                //HLS点播
PLAY_TYPE_VOD_MP4,                //MP4点播
PLAY_TYPE_LIVE_RTMP_ACC,          //RTMP直播加速播放
PLAY_TYPE_LOCAL_VIDEO,            //本地视频文件
*/
