//
//  QRCodeHelper.m
//  QRCatcher
//
//  Created by xiaokai on 1/28/19.
//  Copyright © 2019 xiaokaike. All rights reserved.
//

#import "QRCodeHelper.h"
#import <CoreImage/CoreImage.h>

@implementation QRCodeHelper

//+ (NSString *)getQRCodeContentWithImage:(NSImage *)image{
//    if(!image)return nil;
//    NSData *imageData = [image TIFFRepresentation];
//    return [self getQRCodeContentWithImageData:imageData];
//}

+ (NSString *)getQRCodeContentWithImageData:(NSData *)imageData{
    if(!imageData)return nil;
    CIImage *ciImage = [CIImage imageWithData:imageData];
    //创建探测器
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{CIDetectorAccuracy: CIDetectorAccuracyLow}];
    NSArray *feature = [detector featuresInImage:ciImage];
    NSString *content = nil;
    //取出探测到的数据
    for (CIQRCodeFeature *result in feature) {
        NSLog(@"content:%@",result.messageString);
        content = result.messageString;
    }
    return content;
}

//+ (BOOL)isContainQRCodeWithImage:(NSImage *)image{
//    if(!image)return NO;
//    NSData *imageData = [image TIFFRepresentation];
//    return [self isContainQRCodeWithImageData:imageData];
//}

+ (BOOL)isContainQRCodeWithImageData:(NSData *)imageData{
    if(!imageData)return NO;
    CIImage *ciImage = [CIImage imageWithData:imageData];
    //创建探测器
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{CIDetectorAccuracy: CIDetectorAccuracyLow}];
    NSArray *feature = [detector featuresInImage:ciImage];
    return feature.count?YES:NO;
}

@end
