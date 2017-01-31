//
//  Define.h
//  Specimatch
//
//  Created by Luokey on 1/30/17.
//  Copyright © 2017 root. All rights reserved.
//

#ifndef Define_h
#define Define_h


#define URL_Server                          @"https://api.dev.b4cc.com"
#define URL_Login                           [URL_Server stringByAppendingPathComponent:@"api/v1/auth/login"]



#define ScreenBounds                        [UIScreen mainScreen].bounds

#define SecondsInAMin                       60
#define MinsInAnHour                        60
#define HoursInADay                         24
#define DaysInAMonth                        30
#define MonthsInAYear                       12


#define Segue_ShowMainVC                    @"ShowMainVC"
#define Segue_ShowMainVCWithoutAnimation    @"ShowMainVCWithoutAnimation"
#define Segue_ShowLeftMenu                  @"ShowLeftMenu"
#define Segue_ShowRightMenu                 @"ShowRightMenu"
#define Segue_ShowCareTimelineVC            @"ShowCareTimelineVC"
#define Segue_ShowSpecimatchVC              @"ShowSpecimatchVC"
#define Segue_ShowHealthRecordVC            @"ShowHealthRecordVC"
#define Segue_ShowTutorialsVC               @"ShowTutorialsVC"
#define Segue_ShowProfileVC                 @"ShowProfileVC"
#define Segue_Logout                        @"Logout"



#define MainTintColor                       [UIColor colorWithRed:110/255.f green:193/255.f blue:198/255.f alpha:1.f]


#define key_success                         @"success"

#define key_email                           @"email"
#define key_password                        @"password"

#define key_logged_in_user                  @"logged_in_user"
#define key_patient_dr_id                   @"patient_dr_id"
#define key_resetFlag                       @"resetFlag"
#define key_subscription_status             @"subscription_status"
#define key_token                           @"token"
#define key_tutorial_flag                   @"tutorial_flag"
#define key_tutorial_modal_flag             @"tutorial_modal_flag"
#define key_type                            @"type"
#define key_user_fullname                   @"user_fullname"
#define key_user_type                       @"user_type"



typedef enum MenuItem
{
    MenuItem_CareTimeline = 0,
    MenuItem_Specimatch = 1,
    MenuItem_HealthRecord = 2,
    MenuItem_Tutorials = 3,
    MenuItem_Profile = 4,
    MenuItem_Logout = 5,
}
MenuItem;



#endif /* Define_h */
