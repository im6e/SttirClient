//
//  SttirMenu.m
//  SttirClient
//
//  Created by Takuo IMBE on 2/1/14.
//  Copyright (c) 2014 Takuo IMBE. All rights reserved.
//

#import "SttirMenu.h"
#import "PreferencesWindowController.h"


@implementation SttirMenu
{
    NSMenuItem *_preferences;
    NSMenuItem *_quit;
}

@synthesize prefWindowController;

- (id)init
{
    if ( self = [super init] ) {
        // initialize
        _quit = [[NSMenuItem alloc] initWithTitle:@"Quit" action:@selector(terminate:) keyEquivalent:@""];
        _preferences = [[NSMenuItem alloc] initWithTitle:@"Preferences..." action:@selector(pushedPreferences:) keyEquivalent:@""];
        [_preferences setTarget:self];
        [self addItem:_preferences];
        [self addItem:_quit];
    }
    return self;
}

#pragma mark- NSMenuItem selector
- (void)pushedPreferences:(id)item
{
    DLog(@"pushed preferences");
    
    prefWindowController = [[PreferencesWindowController alloc] initWithWindowNibName:@"PreferencesWindow"];
    [prefWindowController showWindow:self];
    [prefWindowController.window makeMainWindow];
}

@end
