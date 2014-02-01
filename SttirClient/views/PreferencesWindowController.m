//
//  PreferencesWindowController.m
//  SttirClient
//
//  Created by Takuo IMBE on 2/1/14.
//  Copyright (c) 2014 Takuo IMBE. All rights reserved.
//

#import "PreferencesWindowController.h"

@implementation PreferencesWindowController
{
    IBOutlet NSWindow *_prefenreceWindow;
}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

- (IBAction)pushedFolderButton:(id)sender {
    DLog(@"pushed folder button");
}

@end
