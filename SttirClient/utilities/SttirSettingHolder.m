//
//  SttirSettingHolder.m
//  SttirClient
//
//  Created by Takuo IMBE on 2/2/14.
//  Copyright (c) 2014 Takuo IMBE. All rights reserved.
//

#import "SttirSettingHolder.h"

@implementation SttirSettingHolder

+ (NSString*)getSetting:(NSString*)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults stringForKey:key];
}

+ (void)setSetting:(NSString*)value key:(NSString*)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
}


@end
