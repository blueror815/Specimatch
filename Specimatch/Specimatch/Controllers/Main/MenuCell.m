//
//  MenuCell.m
//  GoSkinCare
//
//  Created by Luokey on 11/20/15.
//  Copyright © 2015 Luokey. All rights reserved.
//

#import "MenuCell.h"


@implementation MenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
    
    switch (self.tag) {
        case MenuItem_CareTimeline:
            self.imageName = @"sidemenu_care_timeline";
            break;
        case MenuItem_Specimatch:
            self.imageName = @"sidemenu_specimatch";
            break;
        case MenuItem_HealthRecord:
            self.imageName = @"sidemenu_health_record";
            break;
        case MenuItem_Tutorials:
            self.imageName = @"sidemenu_tutorials";
            break;
        case MenuItem_Profile:
            self.imageName = @"sidemenu_profile";
            break;
        case MenuItem_Logout:
            self.imageName = @"sidemenu_logout";
            break;
            
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    
    if (selected) {
        if (self.imageName)
            self.menuImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_sel", self.imageName]];
        self.menuNameLabel.textColor = [UIColor colorWithRed:108/255.f green:190/255.f blue:195/255.f alpha:1.f];
    }
    else {
        if (self.imageName)
            self.menuImageView.image = [UIImage imageNamed:self.imageName];
        self.menuNameLabel.textColor = self.tag == MenuItem_Logout ? [UIColor darkGrayColor] : [UIColor darkGrayColor];
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted) {
        if (self.imageName)
            self.menuImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_sel", self.imageName]];
        self.menuNameLabel.textColor = [UIColor colorWithRed:108/255.f green:190/255.f blue:195/255.f alpha:1.f];
    }
    else {
        if (self.imageName)
            self.menuImageView.image = [UIImage imageNamed:self.imageName];
        self.menuNameLabel.textColor = self.tag == MenuItem_Logout ? [UIColor darkGrayColor] : [UIColor darkGrayColor];
    }
}

- (void)setImageName:(NSString*)imageName {
    _imageName = imageName;
}

@end
