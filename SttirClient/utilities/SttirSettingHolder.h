//
//  SttirSettingHolder.h
//  SttirClient
//
//  Created by Takuo IMBE on 2/2/14.
//  Copyright (c) 2014 Takuo IMBE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SttirSettingHolder : NSObject

+ (NSString*)getSetting:(NSString*)key;
+ (void)setSetting:(NSString*)value key:(NSString*)key;

@end
