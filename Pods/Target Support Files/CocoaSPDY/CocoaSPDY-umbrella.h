#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSURLRequest+SPDYURLRequest.h"
#import "SPDYCanonicalRequest.h"
#import "SPDYCommonLogger.h"
#import "SPDYDefinitions.h"
#import "SPDYError.h"
#import "SPDYFrame.h"
#import "SPDYFrameDecoder.h"
#import "SPDYFrameEncoder.h"
#import "SPDYHeaderBlockCompressor.h"
#import "SPDYHeaderBlockDecompressor.h"
#import "SPDYLogger.h"
#import "SPDYMetadata+Utils.h"
#import "SPDYOrigin.h"
#import "SPDYOriginEndpoint.h"
#import "SPDYOriginEndpointManager.h"
#import "SPDYProtocol+Project.h"
#import "SPDYProtocol.h"
#import "SPDYSession.h"
#import "SPDYSessionManager.h"
#import "SPDYSessionPool.h"
#import "SPDYSettingsStore.h"
#import "SPDYSocket.h"
#import "SPDYSocketOps.h"
#import "SPDYStopwatch.h"
#import "SPDYStream.h"
#import "SPDYStreamManager.h"
#import "SPDYTLSTrustEvaluator.h"
#import "SPDYZLibCommon.h"

FOUNDATION_EXPORT double CocoaSPDYVersionNumber;
FOUNDATION_EXPORT const unsigned char CocoaSPDYVersionString[];

