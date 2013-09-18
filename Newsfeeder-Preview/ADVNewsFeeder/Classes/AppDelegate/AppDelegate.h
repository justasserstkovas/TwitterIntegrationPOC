//
//  AppDelegate.h
//  ADVNewsFeeder
//
//  Created by Tope on 09/04/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADVTheme.h"
#import "TwitterAdapter.h"

extern CGFloat kCollectionFeedWidthPortrait;
extern CGFloat kCollectionFeedWidthLandscape;

//@class FeedListController;
//@class TwitterFeedViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

+(AppDelegate*)instance;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ACAccountStore *accountStore;

@property (strong, nonatomic) TwitterAdapter *twitterAdapter;

@property (nonatomic, strong) ADVTheme* theme;


@property (strong, nonatomic) UINavigationController *feedNavigationController;

@property (strong, nonatomic) UINavigationController *twitterNavigationController;
@property (strong, nonatomic) UINavigationController *facebookNavigationController;
@property (strong, nonatomic) UINavigationController *settingsNavigationController;


-(void)accessTwitterAccount;

-(void)showError:(NSString*)errorMessage;


@end
