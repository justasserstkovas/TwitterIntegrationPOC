//
//  MainViewController.m
//  TwiiterIntegrationPOC
//
//  Created by Justas Serstkovas on 18/09/2013.
//  Copyright (c) 2013 Justas Serstkovas. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import <Social/Social.h>

@interface MainViewController ()
{
//    NSArray *tweets;
}

//-(void)fetchTweets;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    [self fetchTweets];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadTwitterData) name:AccountTwitterAccessGranted object:nil];
    
    TwitterAdapter* twitterAdapter = [AppDelegate instance].twitterAdapter;
    [twitterAdapter accessTwitterAccountWithAccountStore:[AppDelegate instance].accountStore];

}

- (void)loadTwitterData{
    NSLog(@"access granted");
    TwitterAdapter* twitterAdapter = [AppDelegate instance].twitterAdapter;
    
    [twitterAdapter getTwitterProfileWithCompletion:^(NSDictionary* jsonResponse) {
        [self twitterProfileReceived:jsonResponse];
    }];

}

-(void)twitterProfileReceived:(NSDictionary*)jsonResponse{
    
    NSLog(@"twit profile %@",jsonResponse);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)fetchTweets
//{
//    tweets = [[NSArray alloc] init];
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSData* data = [NSData dataWithContentsOfURL:
//                        [NSURL URLWithString: @"https://api.twitter.com/1.1/search/tweets.json?q=%23good"]];
//        
//        NSError* error;
//        
////        tweets = [NSJSONSerialization JSONObjectWithData:data
////                                                 options:kNilOptions
////                                                   error:&error];
//        NSLog(@"Tweets %@", data);
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
////            [self.tableView reloadData];
//        });
//    });
//}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self.flipsidePopoverController dismissPopoverAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{
    if (!self.flipsidePopoverController) {
        FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil];
        controller.delegate = self;
        
        self.flipsidePopoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
    }
    if ([self.flipsidePopoverController isPopoverVisible]) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    } else {
        [self.flipsidePopoverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

- (IBAction)postTweet:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"#hash @JustasSerstkov"];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"#hash @JustasSerstkov"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }}
@end
