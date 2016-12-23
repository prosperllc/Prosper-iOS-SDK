//
//  Copyright © 2015 Prosper Funding, LLC, All rights reserved.
//


#import <Foundation/Foundation.h>

@interface PMIResponseError : NSObject<NSCopying>

/**
 @abstract returns the reason for the failure.
 */
- (NSString*)getErrorDescription;

/**
 @abstract returns the server error code after server processes the request.
    returns nil if there is no server error code.
 */
- (NSString*)getServerErrorCode;


- (NSString*)getHTTPErrorDescription;

@end
