//
//  SampleVC.m
//  BarButtonGrouping
//
//  Created by Emilio on 06/07/14.
//  Copyright (c) 2014 emlomar. All rights reserved.
//

#import "SampleVC.h"
#import "UINavigationItem+BarButtonGrouping.h"

@interface SampleVC ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation SampleVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

		[self setupSampleData];

    }
    return self;
}

- (void)viewDidLoad{
	[super viewDidLoad];

	//to use it just pass the number of spots available to the grouping method
	[self.navigationItem groupRightBarButtonItems:self.segmentedControl.selectedSegmentIndex];
}

- (void)setupSampleData{

	//clean the buttons
	self.navigationItem.rightBarButtonItems = [[NSArray alloc] init];

	// Add some sample bar button items

	NSMutableArray *barButtons = [[NSMutableArray alloc] init];

	UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] initWithTitle:@"Button1" style:UIBarButtonItemStylePlain target:self action:@selector(buttonPressed:)];
	[barButtons addObject:barButton1];

	UIBarButtonItem *barButton2 = [[UIBarButtonItem alloc] initWithTitle:@"Button2" style:UIBarButtonItemStylePlain target:self action:@selector(buttonPressed:)];
	[barButtons addObject:barButton2];

	UIBarButtonItem *barButton3 = [[UIBarButtonItem alloc] initWithTitle:@"Button3" style:UIBarButtonItemStylePlain target:self action:@selector(buttonPressed:)];
	[barButtons addObject:barButton3];

	UIBarButtonItem *barButton4 = [[UIBarButtonItem alloc] initWithTitle:@"Button4" style:UIBarButtonItemStylePlain target:self action:@selector(buttonPressed:)];
	[barButtons addObject:barButton4];

	UIBarButtonItem *barButton5 = [[UIBarButtonItem alloc] initWithTitle:@"Button5" style:UIBarButtonItemStylePlain target:self action:@selector(buttonPressed:)];
	[barButtons addObject:barButton5];

	UIBarButtonItem *barButton6 = [[UIBarButtonItem alloc] initWithTitle:@"Button6" style:UIBarButtonItemStylePlain target:self action:@selector(buttonPressed:)];
	[barButtons addObject:barButton6];

	self.navigationItem.rightBarButtonItems = barButtons;
}

- (void)buttonPressed:(id)sender{

	NSString *title = [NSString stringWithFormat:@"%@ was selected", ((UIBarButtonItem *)sender).title];

	[[[UIAlertView alloc] initWithTitle:title message:@"" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];

}

- (IBAction)segmentedControlDidChange:(id)sender{

	[self setupSampleData];

	if (!self.segmentedControl.selectedSegmentIndex == 0) {
		[self.navigationItem groupRightBarButtonItems:self.segmentedControl.selectedSegmentIndex];
	}

}

@end
