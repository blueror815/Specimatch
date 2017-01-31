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
    
}

- (IBAction)tapSigninButton:(id)sender {
    [self performSegueWithIdentifier:Segue_ShowMainVC sender:nil];
}

- (IBAction)unwindToLoginVC:(UIStoryboardSegue*)segue {
    
}

- (IBAction)resignInfoFields {
    [self.emailField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}


@end
