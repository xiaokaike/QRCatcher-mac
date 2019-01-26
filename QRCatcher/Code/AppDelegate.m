//
//  AppDelegate.m
//  QrCatcher
//
//  Created by xiaokai on 1/25/19.
//  Copyright © 2019 xiaokaike. All rights reserved.
//

#import "AppDelegate.h"
#import "ContentViewController.h"
#import "AXStatusItemPopup.h"

@interface AppDelegate (){
    AXStatusItemPopup *_statusItemPopup;
}

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    // init content view controller
    // will be shown inside the popover
    ContentViewController *contentViewController = [[ContentViewController alloc] initWithNibName:@"ContentViewController" bundle:nil];
    
    // init the status item popup
    NSImage *image = [NSImage imageNamed:@"QrCatch"];
    NSImage *alternateImage = [NSImage imageNamed:@"QrCatchWhite"];
    
    _statusItemPopup = [[AXStatusItemPopup alloc] initWithViewController:contentViewController image:image alternateImage:alternateImage];
    
    // globally set animation state (optional, defaults to YES)
    _statusItemPopup.animated = YES;
    
    //
    // --------------
    
    // optionally set the popover to the contentview to e.g. hide it from there
    contentViewController.statusItemPopup = _statusItemPopup;
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
