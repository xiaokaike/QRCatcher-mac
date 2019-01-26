//
//  ContentViewController.m
//  QrCatcher
//
//  Created by xiaokai on 1/25/19.
//  Copyright © 2019 xiaokaike. All rights reserved.
//

#import "ContentViewController.h"
#import "Utils.h"

@interface ContentViewController ()
@property (strong) IBOutlet NSTextField *qrResultTextField;

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}


- (void)viewDidAppear {
    [super viewDidAppear];
    
    NSString *scanResult = ScanQRCodeOnScreen();
    NSLog(@"scanResult %@", scanResult);
    
    if (scanResult) {
        self.qrResultTextField.stringValue = scanResult;
    } else {
        self.qrResultTextField.stringValue = @"empty";
    }
}

- (IBAction)closeButtonPressed:(id)sender
{
    [_statusItemPopup hidePopover];
}

@end
