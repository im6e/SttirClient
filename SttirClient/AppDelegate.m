//
//  AppDelegate.m
//  SttirClient
//
//  Created by Takuo IMBE on 2/1/14.
//  Copyright (c) 2014 Takuo IMBE. All rights reserved.
//

#import "AppDelegate.h"
#import "views/SttirMenu.h"

@implementation AppDelegate
{
    NSStatusItem *_statusItem;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self setupStatusItem];
}


#pragma mark- Private Methods
- (void)setupStatusItem {
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [_statusItem setHighlightMode:YES];
    [_statusItem setTitle:@"SC"];
    DLog(@"setting up status bar");
    // TODO: change text to icon
    SttirMenu *_menu = [[SttirMenu alloc] init];
    [_statusItem setMenu:_menu];
}

@end
