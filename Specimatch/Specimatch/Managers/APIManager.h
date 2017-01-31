//
//  APIManager.h
//  GoSkinCare
//
//  Created by Luokey on 11/25/15.
//  Copyright © 2015 Luokey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIManager : NSObject

+ (APIManager*)sharedManager;
- (AFHTTPRequestOperationManager*)operationManager;

- (instancetype)init;

- (void)loginWithEmail:(NSString*)email
              password:(NSString*)password
               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
