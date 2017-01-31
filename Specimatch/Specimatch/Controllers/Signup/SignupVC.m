//
//  SignupVC.m
//  Specimatch
//
//  Created by Luokey on 1/30/17.
//  Copyright © 2017 root. All rights reserved.
//

#import "SignupVC.h"

@interface SignupVC ()

@property (weak, nonatomic) IBOutlet UIView* wrapper;
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

@property (weak, nonatomic) IBOutlet NSLayoutConstraint* wrapperTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* wrapperBottom;

@property (strong, nonatomic) UITextField* curTextField;

@end

@implementation SignupVC

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:self.view.window];
    
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
        [self tapPayButton:nil];
    }
    return YES;
}


#pragma mark -
#pragma mark - Keyboard delegate

- (void)keyboardWillShow:(NSNotification*)notif {
    
    CGRect keyboardBounds;
    [[notif.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [notif.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    // Need to translate the bounds to account for rotation.
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
    [self animateTextFieldUp:YES duration:(CGFloat)duration.floatValue keyboardBounds:keyboardBounds];
}

- (void)keyboardWillHide:(NSNotification*)notif {
    
    CGRect keyboardBounds;
    [[notif.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [notif.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    // Need to translate the bounds to account for rotation.
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
    [self animateTextFieldUp:NO duration:(CGFloat)duration.floatValue keyboardBounds:keyboardBounds];
}

- (void)animateTextFieldUp:(BOOL)up duration:(CGFloat)duration keyboardBounds:(CGRect)keyboardBounds {
    
    if (up) {
        CGFloat maxY = CGRectGetMaxY(self.curTextField.superview.frame);
        CGFloat offset = maxY + CGRectGetHeight(keyboardBounds) + 10.f - CGRectGetHeight(self.wrapper.frame);
        if (offset < 0)
            offset = 0.f;
        
        self.wrapperTop.constant = -offset;
        self.wrapperBottom.constant = offset;
    }
    else {
        self.wrapperTop.constant = 0.f;
        self.wrapperBottom.constant = 0.f;
    }
    
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
    }];
}


@end
