//
//  FileUploaderHelper.h
//  SttirClient
//
//  Created by Takuo IMBE on 2/1/14.
//  Copyright (c) 2014 Takuo IMBE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileUploaderHelper : NSObject

- (void)uploadFileDataByName:(NSString*)fullPath filename:(NSString*)name;

@end
