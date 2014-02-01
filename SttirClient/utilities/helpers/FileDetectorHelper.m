//
//  FileDetectorHelper.m
//  SttirClient
//
//  Created by Takuo IMBE on 2/1/14.
//  Copyright (c) 2014 Takuo IMBE. All rights reserved.
//

#import "FileDetectorHelper.h"

@implementation FileDetectorHelper

- (id)init {
    self = [super init];
    if (self) {
        // initialize
    }
    return self;
}

#pragma mark -publc methods
- (NSMutableArray*)getSpecificExtensionFileByPath:(NSString*)path extensionName:(NSString*)name {
    NSMutableArray *fileList = [[NSMutableArray alloc] init];
    NSError *error;
    NSArray *allFileList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];
    for (NSString *fileName in allFileList) {
        // TODO: すべてのファイルの場合は if 文を外して良い
        if ([fileName hasSuffix:name]) {
            NSString *fullPath = [NSString stringWithFormat:@"%@%@", path, fileName];
            [fileList addObject:fullPath];
         }
    }
    return fileList;
}

@end