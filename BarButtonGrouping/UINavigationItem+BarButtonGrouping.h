//
//  UINavigationItem+BarButtonGrouping.h
//  BarButtonGrouping
//
//  Created by Emilio on 06/07/14.
//  Copyright (c) 2014 emlomar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (BarButtonGrouping) <UIActionSheetDelegate>

@property (nonatomic, strong) UIActionSheet *leftOverflowActionSheet;
@property (nonatomic, strong) NSMutableArray *leftOverflowItems;
@property (nonatomic, strong) NSMutableArray *leftGroupedItems;
@property (nonatomic, strong) UIBarButtonItem *leftOverflowBarButton;

@property (nonatomic, strong) UIActionSheet *rightOverflowActionSheet;
@property (nonatomic, strong) NSMutableArray *rightOverflowItems;
@property (nonatomic, strong) NSMutableArray *rightGroupedItems;
@property (nonatomic, strong) UIBarButtonItem *rightOverflowBarButton;

- (void)groupLeftBarButtonItems:(NSInteger)availableSpots;
- (void)groupRightBarButtonItems:(NSInteger)availableSpots;

typedef enum {
    LeftBarButtons,
    RightBarButtons
} BarButtonsSide;

@end
