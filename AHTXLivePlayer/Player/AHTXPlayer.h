//
//  AHTXPlayer.h
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/26.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AHTXPlayerDef.h"

@class AHTXPlayItem;

@interface AHTXPlayer : NSObject <AHTXPlayer>

@property (weak, nonatomic) AHTXPlayItem *item;
@property (weak, nonatomic) id<AHTXPlayerDelegate> delegate;

@end
