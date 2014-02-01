//
//  SttirProjectUploader.m
//  SttirClient
//
//  Created by Takuo IMBE on 2/1/14.
//  Copyright (c) 2014 Takuo IMBE. All rights reserved.
//

#import "SttirProjectUploader.h"
#import "helpers/FileDetectorHelper.h"
#import "helpers/FileUploaderHelper.h"

@implementation SttirProjectUploader

// TODO: 適切な拡張子に変更
NSString * const kExtensionName = @"jpg";

- (void)callUploadAPI:(NSString *)path
{
    FileDetectorHelper *detector = [[FileDetectorHelper alloc] init];
    FileUploaderHelper *uploader = [[FileUploaderHelper alloc] init];

    // -------------------- finding file name -------------------
    NSArray *fileList = [detector getSpecificExtensionFileByPath:path extensionName:kExtensionName];
    for (NSString *file in fileList) {
        // upload a file
        [uploader uploadFileDataByName:file filename:file];
    }
    // -------------------- finding file name -------------------
}

@end
