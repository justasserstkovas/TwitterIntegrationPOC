//
//  AppDelegate.h
//  TwiiterIntegrationPOC
//
//  Created by Justas Serstkovas on 18/09/2013.
//  Copyright (c) 2013 Justas Serstkovas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterAdapter.h"



@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

+(AppDelegate*)instance;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ACAccountStore *accountStore;

@property (strong, nonatomic) TwitterAdapter *twitterAdapter;

@property (strong, nonatomic) MainViewController *mainViewController;

-(void)accessTwitterAccount;

-(void)showError:(NSString*)errorMessage;

@end
