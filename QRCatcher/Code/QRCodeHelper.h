//
//  QRCodeHelper.h
//  QRCatcher
//
//  Created by xiaokai on 1/28/19.
//  Copyright © 2019 xiaokaike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QRCodeHelper : NSObject
//+ (NSString *)getQRCodeContentWithImage:(NSImage *)image;
+ (NSString *)getQRCodeContentWithImageData:(NSData *)imageData;
//+ (BOOL)isContainQRCodeWithImage:(NSImage *)image;
+ (BOOL)isContainQRCodeWithImageData:(NSData *)imageData;
@end
