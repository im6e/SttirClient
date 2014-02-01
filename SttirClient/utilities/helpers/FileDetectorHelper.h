//
//  FileDetectorHelper.h
//  SttirClient
//
//  Created by Takuo IMBE on 2/1/14.
//  Copyright (c) 2014 Takuo IMBE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileDetectorHelper : NSObject

- (NSMutableArray*)getSpecificExtensionFileByPath:(NSString*)path extensionName:(NSString*)name;

@end
