//
//  AHTXPlayerAgent.h
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/21.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AHTXPlayerDef.h"

@interface AHTXPlayerAgent : NSObject <AHTXPlayer>

+ (instancetype)sharedInstance;

@end
