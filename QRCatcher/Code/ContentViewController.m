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
@property (strong) IBOutlet NSTextView *qrStringTextView;

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [self.qrStringTextView setDrawsBackground:NO];
    [self.qrStringTextView setFont:[NSFont labelFontOfSize:16]];
    [self.qrStringTextView setTextColor:NSColor.darkGrayColor];
}


- (void)viewDidAppear {
    [super viewDidAppear];

    [self readQRStringFromPasteBoard];
    
    NSString *scanResult = ScanQRCodeOnScreen();
    NSLog(@"scanResult %@", scanResult);
    
    if (scanResult) {
        [self.qrStringTextView setString:scanResult];
    } else {
        [self.qrStringTextView setString:@"empty"];
    }
}

- (NSString *)readQRStringFromPasteBoard {
    NSPasteboard *myPasteboard = [NSPasteboard generalPasteboard];
    NSString *myString = [myPasteboard stringForType:NSPasteboardTypeString];
    NSData *pasteboardData = [myPasteboard dataForType:NSPasteboardTypePNG];
    NSLog(@"%@, and data %@", myString, pasteboardData);
    
    NSPasteboardItem *dataHolder = [[NSPasteboardItem alloc] init];
    for (NSString *type in [myPasteboard types]) {
        //Get each type's data and add it to the new dataholder
        NSLog(@"data type %@", type);
        NSData *data = [[myPasteboard dataForType:type] mutableCopy];
        if (data) {
            [dataHolder setData:data forType:type];
        }
    }
    
    return nil;
}

- (NSArray *)readFromPasteBoard {
    NSPasteboard *pasteboard= [NSPasteboard generalPasteboard];
    NSMutableArray *pasteboardItems = [NSMutableArray array];
    
    for (NSPasteboardItem *item in [pasteboard pasteboardItems]) {
        //Create new data holder
        NSPasteboardItem *dataHolder = [[NSPasteboardItem alloc] init];
        //For each type in the pasteboard's items
        for (NSString *type in [item types]) {
            //Get each type's data and add it to the new dataholder
            NSLog(@"data type %@", type);
            NSData *data = [[item dataForType:type] mutableCopy];
            if (data) {
                [dataHolder setData:data forType:type];
            }
        }
        [pasteboardItems addObject:dataHolder];
    }
    return pasteboardItems;
}

- (IBAction)closeButtonPressed:(id)sender
{
    [_statusItemPopup hidePopover];
}

@end
