//
//  LoginVC.m
//  Specimatch
//
//  Created by Luokey on 1/30/17.
//  Copyright © 2017 root. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@property (weak, nonatomic) IBOutlet UITextField* emailField;
@property (weak, nonatomic) IBOutlet UITextField* passwordField;
@property (weak, nonatomic) IBOutlet UIButton* signinButton;
@property (weak, nonatomic) IBOutlet UIButton* createAccountButton;

@property (strong, nonatomic) UITextField* curTextField;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.signinButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.signinButton.layer.borderWidth = 1.f;
    self.signinButton.layer.cornerRadius = 7.f;
    
    self.createAccountButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.createAccountButton.layer.borderWidth = 1.f;
    self.createAccountButton.layer.cornerRadius = 7.f;

    // test code
//    self.emailField.text = @"juan@simms.com";
//    self.passwordField.text = @"admin123";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark -
#pragma mark - Main methods

- (IBAction)tapForgotPasswordButton:(id)sender {
    [self resignInfoFields];
}

- (IBAction)tapSigninButton:(UIButton*)button {
    [self resignInfoFields];
    
    NSString* email = self.emailField.text;
    if (!email || email.length < 1) {
        [[AlertManager sharedManager] showAlertWithTitle:nil message:@"Please type your email." parentVC:self okHandler:^{
            [self.emailField becomeFirstResponder];
        }];
        return;
    }
    
    if (![UtilManager validateEmail:email]) {
        [[AlertManager sharedManager] showAlertWithTitle:nil message:@"The email address is invalid." parentVC:self okHandler:^{
            [self.emailField becomeFirstResponder];
        }];
        return;
    }
    
    NSString* password = self.passwordField.text;
    if (!password || password.length < 1) {
        [[AlertManager sharedManager] showAlertWithTitle:nil message:@"Please type your password." parentVC:self okHandler:^{
            [self.passwordField becomeFirstResponder];
        }];
        return;
    }
    
    
    if (button)
        button.userInteractionEnabled = NO;
    
    
    [SVProgressHUD showWithStatus:@"Signing..."];
    [[APIManager sharedManager] loginWithEmail:email password:password success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary* responseDict = responseObject;
        if (responseObject && [responseObject isKindOfClass:[NSData class]]) {
            NSString* responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
#if DEBUG
            NSLog(@"Gift email response string : %@", responseString);
#endif
            responseDict = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        }
        else {
#if DEBUG
            NSLog(@"Gift email response : %@", responseObject);
#endif
        }
        
        
        [SVProgressHUD dismiss];
        
        if (button)
            button.userInteractionEnabled = YES;
        
        
        if (responseDict) {
            NSString* type = responseDict[key_type];
            if (type && [type isEqualToString:key_success]) {
                [self performSegueWithIdentifier:Segue_ShowMainVC sender:nil];
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [SVProgressHUD dismiss];
        [[AlertManager sharedManager] showAlertWithTitle:nil message:[error localizedDescription] parentVC:self okHandler:nil];
        
        if (button)
            button.userInteractionEnabled = YES;
    }];
}

- (IBAction)unwindToLoginVC:(UIStoryboardSegue*)segue {
    
}

- (IBAction)resignInfoFields {
    [self.emailField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}


#pragma mark -
#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField*)sender {
    self.curTextField = sender;
    
    if ([self.curTextField respondsToSelector:@selector(inputAssistantItem)]) {
        UITextInputAssistantItem* item = [self.curTextField inputAssistantItem];
        item.leadingBarButtonGroups = @[];
        item.trailingBarButtonGroups = @[];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if ([textField isEqual:self.emailField]) {
        [self.passwordField becomeFirstResponder];
    }
    else if ([textField isEqual:self.passwordField]) {
        [self tapSigninButton:nil];
    }
    return YES;
}


@end
