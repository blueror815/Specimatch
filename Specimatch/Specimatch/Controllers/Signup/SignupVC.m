//
//  SignupVC.m
//  Specimatch
//
//  Created by Luokey on 1/30/17.
//  Copyright © 2017 root. All rights reserved.
//

#import "SignupVC.h"

@interface SignupVC ()

@property (weak, nonatomic) IBOutlet UIView* firstnameWrapper;
@property (weak, nonatomic) IBOutlet UITextField* firstnameField;
@property (weak, nonatomic) IBOutlet UIView* lastnameWrapper;
@property (weak, nonatomic) IBOutlet UITextField* lastnameField;
@property (weak, nonatomic) IBOutlet UIView* emailWrapper;
@property (weak, nonatomic) IBOutlet UITextField* emailField;
@property (weak, nonatomic) IBOutlet UIView* passwordWrapper;
@property (weak, nonatomic) IBOutlet UITextField* passwordField;
@property (weak, nonatomic) IBOutlet UIView* confirmWrapper;
@property (weak, nonatomic) IBOutlet UITextField* confirmField;
@property (weak, nonatomic) IBOutlet UIView* inviteCodeWrapper;
@property (weak, nonatomic) IBOutlet UITextField* inviteCodeField;
@property (weak, nonatomic) IBOutlet UIButton* agreeCheckButton;
@property (weak, nonatomic) IBOutlet UIButton* couponCheckButton;
@property (weak, nonatomic) IBOutlet UIButton* payButton;
@property (weak, nonatomic) IBOutlet UIButton* haveAccountButton;

@end

@implementation SignupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.firstnameWrapper.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.firstnameWrapper.layer.borderWidth = 1.f;
    self.lastnameWrapper.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.lastnameWrapper.layer.borderWidth = 1.f;
    self.emailWrapper.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.emailWrapper.layer.borderWidth = 1.f;
    self.passwordWrapper.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.passwordWrapper.layer.borderWidth = 1.f;
    self.confirmWrapper.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.confirmWrapper.layer.borderWidth = 1.f;
    self.inviteCodeWrapper.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.inviteCodeWrapper.layer.borderWidth = 1.f;
    
    self.payButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.payButton.layer.borderWidth = 1.f;
    self.payButton.layer.cornerRadius = 7.f;
    
    self.haveAccountButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.haveAccountButton.layer.borderWidth = 1.f;
    self.haveAccountButton.layer.cornerRadius = 7.f;
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

- (IBAction)tapPayButton:(id)sender {
    
}

- (IBAction)tapAgreeCheckButton:(UIButton*)button {
    button.selected = !button.selected;
}

- (IBAction)tapCouponCheckButton:(UIButton*)button {
    button.selected = !button.selected;
}

- (IBAction)resignInfoFields {
    [self.firstnameField resignFirstResponder];
    [self.lastnameField resignFirstResponder];
    [self.emailField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    [self.confirmField resignFirstResponder];
    [self.inviteCodeField resignFirstResponder];
}


@end
