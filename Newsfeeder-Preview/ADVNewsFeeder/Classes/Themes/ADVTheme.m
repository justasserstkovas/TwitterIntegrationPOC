//
//  ADVTheme.m
//  ADVTimelineDesign
//
//  Created by Tope on 19/03/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "ADVTheme.h"
#import <QuartzCore/QuartzCore.h>

@interface ADVTheme ()

@end

@implementation ADVTheme


- (id)init {
    if ((self = [super init])) {
        self.sharedTheme = [[ADVCustomTheme alloc] init];
        self.sharediPadTheme = [[ADVCustomiPadTheme alloc] init];
    }
    return self;
}

-(void)setupThemes{
    
    [self.sharedTheme setupThemes];
    [self.sharediPadTheme setupThemes];
}


- (void)customizeAppAppearance {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        UIImage* navImage = [self.sharedTheme navigationImage];
        
        UINavigationBar* navAppearance = [UINavigationBar appearance];
        [navAppearance setBackgroundImage:navImage forBarMetrics:UIBarMetricsDefault];
        
        UIToolbar* toolbarAppearance = [UIToolbar appearance];
        [toolbarAppearance setBackgroundImage:navImage forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
        
        UIImage* barButtonImage = [self.sharedTheme barButtonImage];
        UIImage* backButtonImage = [self.sharedTheme backButtonImage];
        
        UIBarButtonItem* barButtonAppearance = [UIBarButtonItem appearance];
        
        [barButtonAppearance setBackgroundImage:barButtonImage forState:UIControlStateNormal style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsDefault];
        
        [barButtonAppearance setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    } else {        
       UIImage* navImage = [self.sharediPadTheme navigationImage];
        
        UINavigationBar* navAppearance = [UINavigationBar appearance];
        [navAppearance setBackgroundImage:navImage forBarMetrics:UIBarMetricsDefault];
        
        UIToolbar* toolbarAppearance = [UIToolbar appearance];
        [toolbarAppearance setBackgroundImage:navImage forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
        
        UIImage* barButtonImage = [self.sharediPadTheme barButtonImage];
        UIImage* backButtonImage = [self.sharediPadTheme backButtonImage];
        
        UIBarButtonItem* barButtonAppearance = [UIBarButtonItem appearance];
        
        [barButtonAppearance setBackgroundImage:barButtonImage forState:UIControlStateNormal style:UIBarButtonItemStyleBordered barMetrics:UIBarMetricsDefault];
        
        [barButtonAppearance setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }

    
}

- (void)customizeView:(UIView *)view{
 
    UIImage* backgroundImage = [self.sharedTheme viewBackground];
    
    [view setBackgroundColor:[UIColor colorWithPatternImage:backgroundImage]];
}

- (void)customizeTableView:(UITableView *)tableView{
    
    [tableView setBackgroundColor:[UIColor clearColor]];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
}

-(CGFloat)articleCellHeightForIndex:(int)index{
    
    if(self.sharedTheme.useLayoutWithImages){
        return index == 0 ? 235 : 105;
    } else {
        return 105;
    }
}


//iPad theming

- (void)customizeViewiPad:(UIView *)view{
    
    UIImage* backgroundImage = [self.sharediPadTheme viewBackground];
    
    [view setBackgroundColor:[UIColor colorWithPatternImage:backgroundImage]];
}

- (void)customizeFeediPadCell:(FeediPadCell *)cell {
    
    [cell.bgImageView setImage:[[UIImage imageNamed:@"bizapp-collection-item"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
    
    [cell.usernameLabel setFont:[UIFont fontWithName:self.sharediPadTheme.boldFontName size:self.sharediPadTheme.usernameLabelSize]];
    
    [cell.tweetLabel setFont:[UIFont fontWithName:self.sharediPadTheme.fontName size:self.sharediPadTheme.tweetLabelSize]];
    
    [cell.dateLabel setFont:[UIFont fontWithName:self.sharediPadTheme.boldFontName size:self.sharediPadTheme.tweetDateLabelSize]];
    
    [cell.usernameLabel setTextColor:self.sharediPadTheme.usernameLabelColor];
    [cell.tweetLabel setTextColor:self.sharediPadTheme.tweetLabelColor];
    [cell.dateLabel  setTextColor:self.sharediPadTheme.tweetDateLabelColor];
    
    [cell.usernameLabel setShadowColor:[UIColor whiteColor]];
    [cell.usernameLabel setShadowOffset:CGSizeMake(0, 1)];
    
    [cell.tweetLabel setShadowColor:[UIColor whiteColor]];
    [cell.tweetLabel setShadowOffset:CGSizeMake(0, 1)];
    
    [cell.dateLabel setShadowColor:[UIColor whiteColor]];
    [cell.dateLabel setShadowOffset:CGSizeMake(0, 1)];
    
    /*
    CALayer* layer = cell.profileImageContainer.layer;
    layer.cornerRadius = 1;
    layer.borderWidth = 3;
    layer.borderColor = [UIColor colorWithWhite:1.0f alpha:1.0f].CGColor;
    layer.shadowColor = [UIColor darkGrayColor].CGColor;
    layer.shadowOpacity = 0.5;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowRadius = 1;
    
    cell.profileImageView.layer.cornerRadius = 2;
    */
}

- (void)customizeFeedProfileiPadCell:(ProfileiPadView*)cell {
    
    [cell.overlayView setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.5]];
    
    [cell.usernameLabel setFont:[UIFont fontWithName:self.sharediPadTheme.boldFontName size:self.sharediPadTheme.usernameSize]];
    
    [cell.screenNameLabel setFont:[UIFont fontWithName:self.sharediPadTheme.boldFontName size:self.sharediPadTheme.screenNameSize]];
    
    [cell.followerCountLabel setFont:[UIFont fontWithName:self.sharediPadTheme.boldFontName size:self.sharediPadTheme.followerCountSize]];
    [cell.followingCountLabel setFont:[UIFont fontWithName:self.sharediPadTheme.boldFontName size:self.sharediPadTheme.followingCountSize]];
    [cell.followerLabel setFont:[UIFont fontWithName:self.sharediPadTheme.boldFontName size:self.sharediPadTheme.followerLabelSize]];
    [cell.followingLabel setFont:[UIFont fontWithName:self.sharediPadTheme.boldFontName size:self.sharediPadTheme.followingLabelSize]];
    
    [cell.followingLabel setTextColor:self.sharediPadTheme.followingLabelColor];
    [cell.followingCountLabel setTextColor:self.sharediPadTheme.followingCountColor];
    [cell.followerLabel setTextColor:self.sharediPadTheme.followerLabelColor];
    [cell.followerCountLabel setTextColor:self.sharediPadTheme.followerCountColor];
    [cell.screenNameLabel setTextColor:self.sharediPadTheme.screenNameColor];
    
    [cell.statsBarView setBackgroundColor:self.sharediPadTheme.statsBarColor];
    
}


@end
