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
@class AHTXPlayItemProgress;

@protocol AHTXPlayItemDelegate <NSObject>

- (void)playItemDidPlay: (AHTXPlayItem *)item;
- (void)playItemDidPause: (AHTXPlayItem *)item;
- (void)playItemDidStop: (AHTXPlayItem *)item;
- (void)playItem: (AHTXPlayItem *)item didChangeProgress: (AHTXPlayItemProgress *)progress;
- (void)playItem: (AHTXPlayItem *)item didChangeLoading: (BOOL)isLoading;

@end

@protocol AHTXPlayer <NSObject>

- (void)playWithItem: (AHTXPlayItem *)item completion: (void (^)(BOOL success, NSError *error))completion;
- (void)resumeWithItem: (AHTXPlayItem *)item completion: (void (^)(BOOL success, NSError *error))completion;
- (void)pauseWithItem: (AHTXPlayItem *)item;
- (void)stopWithItem: (AHTXPlayItem *)item;
- (void)seekWithItem: (AHTXPlayItem *)item time: (float)time completion: (void (^)(BOOL success, NSError *error))completion;
- (BOOL)isPlayingWithItem: (AHTXPlayItem *)item;
- (void)updateProgressWithPlayItem: (AHTXPlayItem *)item;

@end

typedef NS_ENUM(NSUInteger, AHTXPlayerEventType) {
	AHTXPlayerEventType_Unknown,
	AHTXPlayerEventType_Connect,
	AHTXPlayerEventType_Vod_Prepared,
	AHTXPlayerEventType_Start,
	AHTXPlayerEventType_Loading,
	AHTXPlayerEventType_Vod_Loading_End,
	AHTXPlayerEventType_Progress,
	AHTXPlayerEventType_End,
	AHTXPlayerEventType_ResolutionChange,
	AHTXPlayerEventType_RotationChange,
	AHTXPlayerEventType_Disconnect,
	AHTXPlayerEventType_HEVCDecodeFail,
	AHTXPlayerEventType_VideoDecodeFail,
	AHTXPlayerEventType_AudioDecodeFail,
	AHTXPlayerEventType_Lag
};

@class AHTXPlayerEvent;

@protocol AHTXPlayerDelegate <NSObject>

- (void)onAHTXPlayerEvent: (AHTXPlayerEvent *)event;

@end
/*
step1    PLAY_EVT_CONNECT_SUCC            =  2001,   // 已经连接服务器
step2    PLAY_EVT_RTMP_STREAM_BEGIN       =  2002,   // 已经连接服务器，开始拉流
step3    PLAY_EVT_RCV_FIRST_I_FRAME       =  2003,   // 渲染首个视频数据包(IDR)
step3    PLAY_EVT_PLAY_BEGIN              =  2004,   // 视频播放开始
step3    PLAY_EVT_PLAY_PROGRESS           =  2005,   // 视频播放进度
step3    PLAY_EVT_PLAY_END                =  2006,   // 视频播放结束
step3    PLAY_EVT_PLAY_LOADING			  =  2007,   // 视频播放loading
PLAY_EVT_START_VIDEO_DECODER     =  2008,   // 解码器启动
PLAY_EVT_CHANGE_RESOLUTION       =  2009,   // 视频分辨率改变
PLAY_EVT_GET_PLAYINFO_SUCC       =  2010,   // 获取点播文件信息成功
PLAY_EVT_CHANGE_ROTATION         =  2011,   // MP4视频旋转角度
PLAY_EVT_GET_MESSAGE             =  2012,   // 消息事件
PLAY_EVT_VOD_PLAY_PREPARED       =  2013,   // 视频加载完毕（点播）
PLAY_EVT_VOD_LOADING_END         =  2014,   // loading结束（点播）

step1    PLAY_ERR_NET_DISCONNECT          = -2301,   // 网络断连,且经多次重连抢救无效,可以放弃治疗,更多重试请自行重启播放
PLAY_ERR_GET_RTMP_ACC_URL_FAIL   = -2302,   // 获取加速拉流地址失败
PLAY_ERR_FILE_NOT_FOUND          = -2303,   // 播放文件不存在
PLAY_ERR_HEVC_DECODE_FAIL        = -2304,   // H265解码失败
PLAY_ERR_HLS_KEY                 = -2305,   // HLS解码key获取失败
PLAY_ERR_GET_PLAYINFO_FAIL       = -2306,   // 获取点播文件信息失败

step3    PLAY_WARNING_VIDEO_DECODE_FAIL   =  2101,   // 当前视频帧解码失败
step3    PLAY_WARNING_AUDIO_DECODE_FAIL   =  2102,   // 当前音频帧解码失败
step1    PLAY_WARNING_RECONNECT           =  2103,   // 网络断连, 已启动自动重连 (自动重连连续失败超过三次会放弃)
step3    PLAY_WARNING_RECV_DATA_LAG       =  2104,   // 网络来包不稳：可能是下行带宽不足，或由于主播端出流不均匀
step3    PLAY_WARNING_VIDEO_PLAY_LAG      =  2105,   // 当前视频播放出现卡顿（用户直观感受）
step3    PLAY_WARNING_HW_ACCELERATION_FAIL=  2106,   // 硬解启动失败，采用软解
step3    PLAY_WARNING_VIDEO_DISCONTINUITY =  2107,   // 当前视频帧不连续，可能丢帧
step3    PLAY_WARNING_FIRST_IDR_HW_DECODE_FAIL =  2108,   // 当前流硬解第一个I帧失败，SDK自动切软解
step1    PLAY_WARNING_DNS_FAIL            =  3001,   // RTMP -DNS解析失败
step1    PLAY_WARNING_SEVER_CONN_FAIL     =  3002,   // RTMP服务器连接失败
step1    PLAY_WARNING_SHAKE_FAIL          =  3003,   // RTMP服务器握手失败
step1	 PLAY_WARNING_SERVER_DISCONNECT	  =  3004,	 // RTMP服务器主动断开
PLAY_WARNING_READ_WRITE_FAIL     =  3005,   // RTMP 读/写失败，将会断开连接。

UGC     UGC_WRITE_FILE_FAIL              =  4001,   //UGC写文件失败
*/
