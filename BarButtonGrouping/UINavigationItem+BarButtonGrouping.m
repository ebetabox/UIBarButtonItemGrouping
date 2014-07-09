//
//  UINavigationItem+BarButtonGrouping.m
//  BarButtonGrouping
//
//  Created by Emilio on 06/07/14.
//  Copyright (c) 2014 emlomar. All rights reserved.
//

#import "UINavigationItem+BarButtonGrouping.h"
#import <objc/runtime.h>

@implementation UINavigationItem (BarButtonGrouping)


@dynamic rightOverflowBarButton;
@dynamic rightGroupedItems;
@dynamic rightOverflowActionSheet;
@dynamic rightOverflowItems;

@dynamic leftOverflowBarButton;
@dynamic leftGroupedItems;
@dynamic leftOverflowActionSheet;
@dynamic leftOverflowItems;

- (void)setRightGroupedItems:(NSMutableArray *)rightGroupedItems{
	objc_setAssociatedObject(self, @selector(rightGroupedItems), rightGroupedItems, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)rightGroupedItems {
    return objc_getAssociatedObject(self, @selector(rightGroupedItems));
}

- (void)setRightOverflowItems:(NSMutableArray *)rightOverflowItems{
	objc_setAssociatedObject(self, @selector(rightOverflowItems), rightOverflowItems, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)rightOverflowItems {
    return objc_getAssociatedObject(self, @selector(rightOverflowItems));
}


- (void)setRightOverflowBarButton:(UIBarButtonItem *)rightOverflowBarButton{
	objc_setAssociatedObject(self, @selector(rightOverflowBarButton), rightOverflowBarButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)rightOverflowBarButton {
    return objc_getAssociatedObject(self, @selector(rightOverflowBarButton));
}

- (void)setRightOverflowActionSheet:(UIActionSheet *)rightOverflowActionSheet{
	objc_setAssociatedObject(self, @selector(rightOverflowActionSheet), rightOverflowActionSheet, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)rightOverflowActionSheet {
    return objc_getAssociatedObject(self, @selector(rightOverflowActionSheet));
}

- (void)setLeftGroupedItems:(NSMutableArray *)leftGroupedItems{
	objc_setAssociatedObject(self, @selector(leftGroupedItems), leftGroupedItems, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)leftGroupedItems {
    return objc_getAssociatedObject(self, @selector(leftGroupedItems));
}

- (void)setLeftOverflowItems:(NSMutableArray *)leftOverflowItems{
	objc_setAssociatedObject(self, @selector(leftOverflowItems), leftOverflowItems, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)leftOverflowItems {
    return objc_getAssociatedObject(self, @selector(leftOverflowItems));
}


- (void)setLeftOverflowBarButton:(UIBarButtonItem *)leftOverflowBarButton{
	objc_setAssociatedObject(self, @selector(leftOverflowBarButton), leftOverflowBarButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)leftOverflowBarButton {
    return objc_getAssociatedObject(self, @selector(leftOverflowBarButton));
}

- (void)setLeftOverflowActionSheet:(UIActionSheet *)leftOverflowActionSheet{
	objc_setAssociatedObject(self, @selector(leftOverflowActionSheet), leftOverflowActionSheet, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)leftOverflowActionSheet {
    return objc_getAssociatedObject(self, @selector(leftOverflowActionSheet));
}

- (void)groupRightBarButtonItems:(NSInteger)availableSpots{
	self.rightBarButtonItems = [self groupedBarButtonItems:availableSpots forSide:RightBarButtons];
}

- (void)groupLeftBarButtonItems:(NSInteger)availableSpots{
	self.leftBarButtonItems = [self groupedBarButtonItems:availableSpots forSide:LeftBarButtons];
}

- (NSArray *)groupedBarButtonItems:(NSInteger)availableSpots forSide:(BarButtonsSide)side{

	NSMutableArray *barButtonItems;
	NSArray *visibleBarButtons;
	NSMutableArray *groupedItems;
	UIActionSheet *overflowActionSheet;
	UIBarButtonItem *overflowBarButton;

	switch (side) {
		case RightBarButtons:
			barButtonItems = [NSMutableArray arrayWithArray:self.rightBarButtonItems];
			break;

		case LeftBarButtons:
			barButtonItems = [NSMutableArray arrayWithArray:self.leftBarButtonItems];
			break;

		default:
			NSLog(@"mmmm weird...");
			barButtonItems = [NSMutableArray array];
			break;
	}

	//there is nothing to do if the buttons already fit in the spots
	if (barButtonItems.count>availableSpots) {

		//the last spot will be used to display an overflow action sheet
		visibleBarButtons = [barButtonItems subarrayWithRange:NSMakeRange(0, availableSpots-1)];

		//keep only the non visible ones
		[barButtonItems removeObjectsInArray:visibleBarButtons];

		//compose the overflow action sheet
		overflowActionSheet = [[UIActionSheet alloc] init];
		overflowActionSheet.delegate = self;

		//Create an action sheet to hold the buttons that exceed the available spots
		for (UIBarButtonItem *barButton in barButtonItems) {
			if (barButton.title) {
				[overflowActionSheet addButtonWithTitle:barButton.title];
			}
			else{
				[overflowActionSheet addButtonWithTitle:@"no title"];
			}
		}

		overflowActionSheet.cancelButtonIndex = [overflowActionSheet addButtonWithTitle:@"Cancel"];

		overflowBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Overflow" style:UIBarButtonItemStylePlain target:self action:@selector(showOverflowActionSheet:)];


		groupedItems = [NSMutableArray arrayWithArray:visibleBarButtons];

		[groupedItems insertObject:overflowBarButton atIndex:0];
		//[groupedItems addObject:overflowBarButton];

	}

	switch (side) {
		case RightBarButtons:

			self.rightOverflowActionSheet = overflowActionSheet;
			self.rightOverflowBarButton = overflowBarButton;
			self.rightGroupedItems = [NSMutableArray arrayWithArray:groupedItems];
			self.rightOverflowItems = barButtonItems;

			break;

		case LeftBarButtons:

			self.leftOverflowActionSheet = overflowActionSheet;
			self.leftOverflowBarButton = overflowBarButton;
			self.leftGroupedItems = [NSMutableArray arrayWithArray:groupedItems];
			self.leftOverflowItems = barButtonItems;

			break;

		default:
			NSLog(@"mmmm weird...");
			barButtonItems = [NSMutableArray array];
			break;
	}

	return groupedItems;
}

- (void)showOverflowActionSheet:(id)sender{

	if (sender == self.rightOverflowBarButton) {
		[self.rightOverflowActionSheet showFromBarButtonItem:self.rightOverflowBarButton animated:YES];
	}
	else if (sender == self.leftOverflowBarButton) {
		[self.leftOverflowActionSheet showFromBarButtonItem:self.leftOverflowBarButton animated:YES];
	}

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{

	UIBarButtonItem *selectedBarButton;

	if (actionSheet == self.rightOverflowActionSheet && buttonIndex<self.rightOverflowItems.count) {
		selectedBarButton = (UIBarButtonItem *)[self.rightOverflowItems objectAtIndex:buttonIndex];
	}
	else if (actionSheet == self.leftOverflowActionSheet && buttonIndex<self.leftOverflowItems.count) {
		selectedBarButton = (UIBarButtonItem *)[self.leftOverflowItems objectAtIndex:buttonIndex];
	}

	if (selectedBarButton) {
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
		[selectedBarButton.target performSelector:selectedBarButton.action withObject:selectedBarButton];
	}
}



@end
