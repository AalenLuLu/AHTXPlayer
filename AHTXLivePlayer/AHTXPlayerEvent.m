//
//  AHTXPlayerEvent.m
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/7/9.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import "AHTXPlayerEvent.h"
#import "AHTXPlayerEventBuilderFactory.h"
#import "AHTXPlayerEventBuilder.h"
#import <TXLiveSDKTypeDef.h>

@implementation AHTXPlayerEvent

- (instancetype)initWithEventID:(int)eventID params:(NSDictionary *)params
{
	if(self = [super init])
	{
		/*
		 #define EVT_MSG                      @"EVT_MSG"
		 #define EVT_TIME                     @"EVT_TIME"
		 #define EVT_PARAM1					 @"EVT_PARAM1"
		 #define EVT_PARAM2					 @"EVT_PARAM2"
		 #define EVT_PLAY_PROGRESS            @"EVT_PLAY_PROGRESS"
		 #define EVT_PLAY_DURATION            @"EVT_PLAY_DURATION"
		 #define EVT_PLAYABLE_DURATION        @"PLAYABLE_DURATION"
		 #define EVT_REPORT_TOKEN             @"EVT_REPORT_TOKEN"
		 #define EVT_GET_MSG                  @"EVT_GET_MSG"
		 #define EVT_PLAY_COVER_URL           @"EVT_PLAY_COVER_URL"   //视频封面
		 #define EVT_PLAY_URL                 @"EVT_PLAY_URL"         //视频播放地址
		 #define EVT_PLAY_NAME                @"EVT_PLAY_NAME"        //视频名称
		 #define EVT_PLAY_DESCRIPTION         @"EVT_PLAY_DESCRIPTION" //视频简介
		 */
		_eventType = [self _eventTypeWithEventID: eventID];
		AHTXPlayerEventBuilder *builder = [AHTXPlayerEventBuilderFactory builderForEventType: _eventType];
		[builder buildEvent: self params: params];
	}
	return self;
}

- (AHTXPlayerEventType)_eventTypeWithEventID: (int)eventID
{
	/*
	 AHTXPlayerEvent_Unknown,
	 AHTXPlayerEvent_Connect,
	 AHTXPlayerEvent_Start,
	 AHTXPlayerEvent_Loading,
	 AHTXPlayerEvent_Progress,
	 AHTXPlayerEvent_End,
	 AHTXPlayerEvent_ResolutionChange,
	 AHTXPlayerEvent_RotationChange,
	 AHTXPlayerEvent_Disconnect,
	 AHTXPlayerEvent_HEVCDecodeFail,
	 AHTXPlayerEvent_VideoDecodeFail,
	 AHTXPlayerEvent_AudioDecodeFail,
	 AHTXPlayerEvent_Lag
	 */
	AHTXPlayerEventType event = AHTXPlayerEventType_Unknown;
	switch (eventID) {
		case PLAY_EVT_CONNECT_SUCC:
			event = AHTXPlayerEventType_Connect;
			break;
			
		case PLAY_EVT_PLAY_BEGIN:
			event = AHTXPlayerEventType_Start;
			break;
			
		case PLAY_EVT_PLAY_LOADING:
			event = AHTXPlayerEventType_Loading;
			break;
			
		case PLAY_EVT_PLAY_PROGRESS:
			event = AHTXPlayerEventType_Progress;
			break;
			
		case PLAY_EVT_PLAY_END:
			event = AHTXPlayerEventType_End;
			break;
			
		case PLAY_EVT_CHANGE_RESOLUTION:
			event = AHTXPlayerEventType_ResolutionChange;
			break;
			
		case PLAY_EVT_CHANGE_ROTATION:
			event = AHTXPlayerEventType_RotationChange;
			break;
			
		case PLAY_ERR_NET_DISCONNECT:
		case PLAY_WARNING_DNS_FAIL:
		case PLAY_WARNING_SEVER_CONN_FAIL:
		case PLAY_WARNING_SHAKE_FAIL:
		case PLAY_WARNING_SERVER_DISCONNECT:
			event = AHTXPlayerEventType_Disconnect;
			break;
			
		case PLAY_ERR_HEVC_DECODE_FAIL:
			event = AHTXPlayerEventType_HEVCDecodeFail;
			break;
			
		case PLAY_WARNING_VIDEO_DECODE_FAIL:
			event = AHTXPlayerEventType_VideoDecodeFail;
			break;
			
		case PLAY_WARNING_AUDIO_DECODE_FAIL:
			event = AHTXPlayerEventType_AudioDecodeFail;
			break;
			
		case PLAY_WARNING_RECV_DATA_LAG:
		case PLAY_WARNING_VIDEO_PLAY_LAG:
		case PLAY_WARNING_VIDEO_DISCONTINUITY:
			event = AHTXPlayerEventType_Lag;
			break;
			
		default:
			event = AHTXPlayerEventType_Unknown;
			break;
	}
	return event;
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
	 PLAY_EVT_CHANGE_ROATION          =  2011,   // MP4视频旋转角度
	 PLAY_EVT_GET_MESSAGE             =  2012,   // 消息事件
	 
	 
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
}

@end
