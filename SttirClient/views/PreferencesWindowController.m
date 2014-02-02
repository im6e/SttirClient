//
//  PreferencesWindowController.m
//  SttirClient
//
//  Created by Takuo IMBE on 2/1/14.
//  Copyright (c) 2014 Takuo IMBE. All rights reserved.
//

#import "PreferencesWindowController.h"
#import "SttirSettingHolder.h"

@implementation PreferencesWindowController
{
    IBOutlet NSWindow *_prefenreceWindow;
    IBOutlet NSTextField *_directoryField;
    IBOutlet NSButton *_chooseFolderButton;
    IBOutlet NSButton *_okButton;

    NSString *_pathname;
}

- (void)awakeFromNib
{
    [_directoryField setStringValue:_pathname];
}

- (id)initWithWindowNibName:(NSString *)windowNibName
{
    if (self = [super initWithWindowNibName:windowNibName]) {
        _pathname = [SttirSettingHolder getSetting:STTIR_DIR_KEY];
    }
    return self;
}

#pragma mark- NSButton Action Methods
- (IBAction)pushedFolderButton:(id)sender
{
    DLog(@"pushed folder button");

    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    [openPanel setCanChooseDirectories:YES];
    [openPanel setCanChooseFiles:NO];
    NSInteger pressedButton = [openPanel runModal];

    if ( pressedButton == NSOKButton ) {
        // get file path
        NSURL *filePath = [openPanel URL];
        DLog(@"dir: %@", [filePath path]);
        [_directoryField setStringValue:[filePath path]];
    } else if( pressedButton == NSCancelButton ) {
        DLog(@"cancel button pushed");
    } else {
        DLog(@"something went wrong");
    }
}

- (IBAction)pushedOkButton:(id)sender
{
    DLog(@"pushed ok");
    if ([_directoryField.stringValue length] > 0) {
        [SttirSettingHolder setSetting:_directoryField.stringValue key:STTIR_DIR_KEY];
        [_prefenreceWindow close];
    } else {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:@"Please choose the folder."];
        [alert runModal];
    }
}

@end
