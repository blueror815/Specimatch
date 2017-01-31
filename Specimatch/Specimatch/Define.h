//
//  Define.h
//  Specimatch
//
//  Created by Luokey on 1/30/17.
//  Copyright © 2017 root. All rights reserved.
//

#ifndef Define_h
#define Define_h



#define ScreenBounds                        [UIScreen mainScreen].bounds


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
