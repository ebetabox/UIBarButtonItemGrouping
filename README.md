UIBarButtonItemGrouping
=======================

iOS category on UINavigationItem to easily group bar button items

This category will group the bar button items into the given spots

## What does this category

Basically rearanges the right bar button items (or left) to fit into a number of spots, the overflow items are grouped into a UIActionSheet.


Imagine you need to add 6 bar buttons to the right bar button items

#####Without grouping
![](https://raw.githubusercontent.com/emilio-lopez/UIBarButtonItemGrouping/master/Screenshots/iPhone_disabled.png)

#####Grouping with 2 spots

![](https://raw.githubusercontent.com/emilio-lopez/UIBarButtonItemGrouping/master/Screenshots/iPhone_2_spots.png)

#####Grouping with 3 spots and overflow button selected

![](https://raw.githubusercontent.com/emilio-lopez/UIBarButtonItemGrouping/master/Screenshots/iPhone_3_spots_selected.png)

## Demo

Check the sample project to see how this category works

## How to use it

- Add the "UINavigationItem+BarButtonGrouping.h" and "UINavigationItem+BarButtonGrouping.m" files to your project

- Import the header on your View Controller

```Objective-C
#import "UINavigationItem+BarButtonGrouping.h"
````

- Call the method to group the bar button items setting the available spots

```Objective-C
[self.navigationItem groupRightBarButtonItems:numOfAvailableSpots];
````

Thats it!
