//
//  UITableView+PopOnSwipeRight.h
//  SwipeNavigation
//
//  Created by Simon Andersson on 5/3/12.
//  Copyright (c) 2011 Simon Andersson, http://hiddencode.me/
//  
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//  
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <UIKit/UIKit.h>

/** Defines the DrawRectBlock type */
typedef void(^DrawRectBlock)(CGRect rect);

@interface HCView : UIView {
@private
    DrawRectBlock block;
}

/**
 A convenient method to define the drawRect: block
 
 @param block The drawRect: block
 */
- (void)setDrawRectBlock:(DrawRectBlock)block;

@end

@interface UIView (Other)

///------------------
/// @name Properties
///------------------

/** Returns and sets the width */
@property(nonatomic, readwrite) CGFloat width;

/** Returns and sets the height */
@property(nonatomic, readwrite) CGFloat height;

/** Returns and sets the offset to the top */
@property(nonatomic, readwrite) CGFloat top;

/** Returns and sets the offset to the left */
@property(nonatomic, readwrite) CGFloat left;


///------------------
/// @name Initializes the DrawRectBlock View
///------------------

/**
 Creates a view with a drawRect: block
 
 @param frame The rectangle of the view
 @param block The DrawRect of the block
 
 @return UIView with the target frame and graphic context
 */
+ (UIView *)viewWithFrame:(CGRect)frame drawRect:(DrawRectBlock)block;
@end

@interface UIGestureRecognizer (Additions)

///------------------
/// @name Methods
///------------------

/** Cancels a UIGestureRecognizer */
- (void)cancel;
@end

@interface UINavigationController (PopOnSwipeRight)

///------------------
/// @name Properties
///------------------

/**
 Sets and returns and current pop indicator view
 Default nil
 */
@property (nonatomic, strong) UIView *leftArrowView;

/**
 Sets and returns the number of touches required to swipe-to-pop
 Default 2
 */
@property (nonatomic) int numberOfTouches;

/**
 Sets and returns the amout of pixels required to drag before pop
 Default 300.0
 */
@property (nonatomic) float distanceToDrag;

@end
