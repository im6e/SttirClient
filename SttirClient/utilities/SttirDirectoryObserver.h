//
//  SttirDirectoryObserver.h
//  SttirClient
//
//  Created by Takuo IMBE on 2/1/14.
//  Copyright (c) 2014 Takuo IMBE. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SttirDirectoryObserverDelegate <NSObject>
- (void)onDirectoryChanged:(id)sender directories:(NSArray *)directories;
@end

@interface SttirDirectoryObserver : NSObject

// Public Methods
- (id)initWithDirectoryPath:(NSString *)path;
- (void)startObserving;
- (void)stopObserving;

@property (weak, nonatomic) id<SttirDirectoryObserverDelegate> delegate;

@end
