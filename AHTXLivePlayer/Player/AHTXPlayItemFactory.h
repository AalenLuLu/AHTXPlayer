//
//  AHTXPlayItemFactory.h
//  AHTXLivePlayerDemo
//
//  Created by Aalen on 2018/5/22.
//  Copyright © 2018年 Aalen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AHTXPlayItem;

@interface AHTXPlayItemFactory : NSObject

- (AHTXPlayItem *)playItemWithURLString: (NSString *)urlString;
- (AHTXPlayItem *)createPlayItem;

@end
