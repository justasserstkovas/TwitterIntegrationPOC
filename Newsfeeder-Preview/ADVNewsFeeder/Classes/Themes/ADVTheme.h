//
//  ADVTheme.h
//  ADVTimelineDesign
//
//  Created by Tope on 19/03/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeediPadCell.h"
#import "ProfileiPadView.h"
#import "ADVCustomTheme.h"
#import "ADVCustomiPadTheme.h"



typedef enum  {
    CellLocationTop,
    CellLocationMiddle,
    CellLocationBottom
}CellLocation;



@interface ADVTheme : NSObject

@property (nonatomic, strong) ADVCustomTheme *sharedTheme;

@property (nonatomic, strong) ADVCustomiPadTheme *sharediPadTheme;

-(void)setupThemes;

- (void)customizeAppAppearance;
- (void)customizeView:(UIView *)view;
- (void)customizeTableView:(UITableView *)tableView;
- (CGFloat)articleCellHeightForIndex:(int)index;

//iPad theming
- (void)customizeViewiPad:(UIView *)view;
- (void)customizeFeediPadCell:(FeediPadCell *)cell;
- (void)customizeFeedProfileiPadCell:(ProfileiPadView*)cell;



@end
