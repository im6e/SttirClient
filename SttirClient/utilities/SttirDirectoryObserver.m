//
//  SttirDirectoryObserver.m
//  SttirClient
//
//  Created by Takuo IMBE on 2/1/14.
//  Copyright (c) 2014 Takuo IMBE. All rights reserved.
//

#import "SttirDirectoryObserver.h"
#import "SttirProjectUploader.h"
#import <CoreServices/CoreServices.h>

@interface SttirDirectoryObserver()

- (void)onDirectoryChanged:(NSArray *)directories;

@end

@implementation SttirDirectoryObserver
{
    NSString *_path;
    FSEventStreamRef _stream;
}

#pragma mark- Public Methods
- (id)initWithDirectoryPath:(NSString *)path
{
    if(self = [super init])
    {
        _path = path;
    }
    return self;
}

- (void)startObserving
{
    if(_stream) return;

    FSEventStreamContext context = {0};
    context.info = (__bridge void *)self;
    CFTimeInterval latency = 0.1;
    _stream = FSEventStreamCreate(kCFAllocatorDefault,
                                  fs_event_callback,
                                  &context,
                                  (__bridge CFArrayRef)@[_path],
                                  kFSEventStreamEventIdSinceNow,
                                  latency,
                                  kFSEventStreamCreateFlagNone);

    FSEventStreamScheduleWithRunLoop(_stream, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode);
    FSEventStreamStart(_stream);

    DLog(@"### start observing directory - %@", _path);
}

- (void)stopObserving
{
    if(_stream == NULL) return;

    FSEventStreamStop(_stream);
    FSEventStreamUnscheduleFromRunLoop(_stream, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode);
    FSEventStreamRelease(_stream);
    _stream = NULL;

    DLog(@"### stop observing directory - %@", _path);
}

- (void)onDirectoryChanged:(NSArray *)directories
{
    if(self.delegate) {
        [self.delegate onDirectoryChanged:self directories:directories];
    }
}


#pragma mark- Private Methods
void fs_event_callback(ConstFSEventStreamRef streamRef, void *clientCallBackInfo, size_t numEvents,
                       void *eventPaths, const FSEventStreamEventFlags eventFlags[], const FSEventStreamEventId eventIds[])
{
    char **paths = eventPaths;
    NSMutableArray *directories = [NSMutableArray array];

    SttirProjectUploader *_projectUploader = [[SttirProjectUploader alloc] init];

    for (int i = 0 ; i < numEvents ; i++) {
        NSString *strPath = [NSString stringWithCString:paths[i] encoding:NSUTF8StringEncoding];
        [_projectUploader callUploadAPI:strPath];
        [directories addObject:strPath];
    }

    SttirDirectoryObserver *observer = (__bridge SttirDirectoryObserver *)clientCallBackInfo;
    [observer onDirectoryChanged:directories];
}

@end