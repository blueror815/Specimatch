//
//  APIManager.m
//  GoSkinCare
//
//  Created by Luokey on 11/25/15.
//  Copyright © 2015 Luokey. All rights reserved.
//

#import "APIManager.h"

@implementation APIManager

+ (APIManager*)sharedManager {
    
    static APIManager* _sharedManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;
}

- (AFHTTPRequestOperationManager*)operationManager {
    
    AFHTTPRequestOperationManager* operationManager = [AFHTTPRequestOperationManager manager];
    
    // test code to mark json format
//    operationManager.responseSerializer = [AFJSONResponseSerializer serializer];
    operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [operationManager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:
                                                                    @"application/x-www-form-urlencoded",
                                                                    @"application/json",
                                                                    @"text/plain",
                                                                    @"text/html",
                                                                    nil]];
    
//    if (self.apiToken)
//        [operationManager.requestSerializer setValue:self.apiToken forHTTPHeaderField:key_apitoken];
    
    return operationManager;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
    }
    
    return self;
}

- (NSString*)jsonStringWithJsonDict:(NSDictionary*)jsonDict {
    NSString* jsonString = @"";
    
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict options:kNilOptions error:nil];
    if (jsonData)
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return jsonString;
}


#pragma mark -
#pragma mark - // Apis

- (void)loginWithEmail:(NSString*)email
              password:(NSString*)password
               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    NSDictionary* params = @{key_email: email,
                             key_password: password
                             };
    
    AFHTTPRequestOperationManager* operationManager = [self operationManager];
    [operationManager POST:URL_Login parameters:params success:success failure:failure];
}


@end
