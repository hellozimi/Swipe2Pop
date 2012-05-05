Swipe2Pop
=========

This category lets you two finger swipe to the right to pop on the navigation controller

##Usage
Just `import "UINavigationController+PopOnSwipeRight.h"` where you initialize your Navigation Controller and you're good to go.
	
	// Initialize the Navigation Controller
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    
	// Set the indicator view
    nc.leftArrowView = [UIView viewWithFrame:CGRectMake(0, 0, 100, 100) drawRect:^(CGRect rect) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        [[[UIColor blackColor] colorWithAlphaComponent:0.8] setFill];
        
        CGContextAddEllipseInRect(context, CGRectMake(-rect.size.width/2, 0, rect.size.width, rect.size.height));
        CGContextFillPath(context);
    }];
	
	// Set how far you have to drag before it should pop (in pixels)
    nc.distanceToDrag = 250;
	
	// Set how many fingers you should use to activate
    nc.numberOfTouches = 3;


---
