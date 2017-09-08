//
//  Copyright © 2015 Prosper Funding, LLC, All rights reserved.
//


#import <Foundation/Foundation.h>

@interface PMIProsperConfig : NSObject

/**
 * Initializes the Prosper configuration
 
 param clientId pass the clientID that is communicated
 param clientSecret pass the clientSecret that is communicated
 param refMC pass the refMC that is communicated
 param refAC pass the refAC that is communicated
 param flag  pass YES if the clientId, ClientSecret are for production environment
             pass NO if the clientId, ClientSecret are for sandbox environment
**/
+ (void) initWithClientId:(NSString*)clientId
             clientSecret:(NSString*)clientSecret
                    refMC:(NSString*)refMC
                    refAC:(NSString*)refAC
          prodCredentials:(BOOL)flag;

@end
