//
//  AHTXPlayItemProgress.h
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/7/15.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AHTXPlayItemProgress : NSObject

@property (assign, nonatomic) NSTimeInterval duration;
@property (assign, nonatomic) NSTimeInterval playbackTime;
@property (assign, nonatomic) NSTimeInterval cachedDuration;

@end
