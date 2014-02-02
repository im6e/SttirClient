//
//  AppDelegate.m
//  SttirClient
//
//  Created by Takuo IMBE on 2/1/14.
//  Copyright (c) 2014 Takuo IMBE. All rights reserved.
//

#import "AppDelegate.h"
#import "views/SttirMenu.h"
#import "utilities/SttirDirectoryObserver.h"
#import "utilities/SttirSettingHolder.h"

@implementation AppDelegate
{
    NSStatusItem *_statusItem;
    SttirDirectoryObserver *_direcotryObserver;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self setupStatusItem];

    // path が設定されていたら監視開始、なければ setting
    NSString *pathname = [SttirSettingHolder getSetting:STTIR_DIR_KEY];
    if (!pathname) {
        // TODO: if dir haven't been set yet. show Preferences window.
    } else {
        _direcotryObserver = [[SttirDirectoryObserver alloc] initWithDirectoryPath:pathname];
        [_direcotryObserver startObserving];
    }
}


#pragma mark- Private Methods
- (void)setupStatusItem {
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [_statusItem setHighlightMode:YES];
    [_statusItem setTitle:@"SC"];
    // TODO: change text to icon
    SttirMenu *_menu = [[SttirMenu alloc] init];
    [_statusItem setMenu:_menu];
}

@end
