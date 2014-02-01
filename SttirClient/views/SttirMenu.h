//
//  SttirMenu.h
//  SttirClient
//
//  Created by Takuo IMBE on 2/1/14.
//  Copyright (c) 2014 Takuo IMBE. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PreferencesWindowController.h"

@interface SttirMenu : NSMenu

@property (strong, nonatomic) PreferencesWindowController *prefWindowController;

@end
