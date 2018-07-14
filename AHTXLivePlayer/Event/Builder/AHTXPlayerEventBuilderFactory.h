//
//  AHTXPlayerEventBuilderFactory.h
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/7/14.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AHTXPlayerDef.h"

@class AHTXPlayerEventBuilder;

@interface AHTXPlayerEventBuilderFactory : NSObject

+ (AHTXPlayerEventBuilder *)builderForEventType: (AHTXPlayerEventType)eventType;

@end
