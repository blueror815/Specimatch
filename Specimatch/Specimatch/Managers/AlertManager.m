//
//  AlertManager.m
//  GoSkinCare
//
//  Created by Luokey on 10/9/15.
//  Copyright © 2015 Luokey. All rights reserved.
//

#import "AlertManager.h"

typedef void (^AlertHandler)();

@interface AlertManager ()

@end

@implementation AlertManager

+ (AlertManager* _Nullable)sharedManager {
    
    static AlertManager* _sharedManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;
}

- (void)showAlertWithTitle:(NSString* __nullable)title message:(NSString* __nullable)message parentVC:(UIViewController* __nullable)parentVC okHandler:(void (^ __nullable)())okHandler {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (okHandler)
            okHandler();
    }]];
    
    alert.view.tintColor = MainTintColor;
    
    [parentVC presentViewController:alert animated:YES completion:^{
    }];
}

- (void)showConfirmWithTitle:(NSString* __nullable)title message:(NSString* __nullable)message parentVC:(UIViewController* __nullable)parentVC cancelHandler:(void (^ __nullable)())cancelHandler okHandler:(void (^ __nullable)())okHandler {
    
    UIAlertController* confirm = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    [confirm addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (okHandler)
            okHandler();
    }]];
    [confirm addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelHandler)
            cancelHandler();
    }]];
    
    confirm.view.tintColor = MainTintColor;
    
    [parentVC presentViewController:confirm animated:YES completion:^{
    }];
}

@end
