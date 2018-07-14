//
//  AHTXPlayerEventHandler.h
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/7/15.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AHTXPlayerEvent;
@class AHTXPlayItem;

@interface AHTXPlayerEventHandler : NSObject

- (void)handleEvent: (AHTXPlayerEvent *)event item: (AHTXPlayItem *)item;

@end
