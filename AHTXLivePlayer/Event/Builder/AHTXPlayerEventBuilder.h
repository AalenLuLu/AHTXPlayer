//
//  AHTXPlayerEventBuilder.h
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/7/14.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AHTXPlayerEvent;

@interface AHTXPlayerEventBuilder : NSObject

- (void)buildEvent: (AHTXPlayerEvent *)event params: (NSDictionary *)params;

@end
