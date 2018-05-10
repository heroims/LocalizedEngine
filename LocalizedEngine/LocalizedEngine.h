//
//  LocalizedEngine.h
//  admin
//
//  Created by admin on 2017/1/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LocalizedEngineSwizzling)

@property(nonatomic,assign)BOOL disableAutoLocalized;

@end

@interface LocalizedEngine : NSObject

+(void)startEngine;

@end
