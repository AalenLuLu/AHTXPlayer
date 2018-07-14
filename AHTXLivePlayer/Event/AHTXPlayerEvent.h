//
//  AHTXPlayerEvent.h
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/7/9.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AHTXPlayerDef.h"

NS_ASSUME_NONNULL_BEGIN

@interface AHTXPlayerEvent : NSObject

@property (assign, nonatomic) AHTXPlayerEventType eventType;
@property (copy, nonatomic) NSString *msg;
@property (assign, nonatomic) NSTimeInterval time;
@property (copy, nonatomic) NSString *duration;
@property (copy, nonatomic) NSString *cachedDuration;
@property (copy, nonatomic) NSString *progress;
@property (assign, nonatomic) CGSize resolution;

- (instancetype)initWithEventID: (int)eventID params: (NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
