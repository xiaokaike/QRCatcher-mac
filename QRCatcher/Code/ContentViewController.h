//
//  ContentViewController.h
//  QrCatcher
//
//  Created by xiaokai on 1/25/19.
//  Copyright © 2019 xiaokaike. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AXStatusItemPopup.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContentViewController : NSViewController

@property(weak, nonatomic) AXStatusItemPopup *statusItemPopup;

- (IBAction)closeButtonPressed:(id)sender;

@end

NS_ASSUME_NONNULL_END
