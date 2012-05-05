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

#import "UINavigationController+PopOnSwipeRight.h"

@implementation HCView

- (void)setDrawRectBlock:(DrawRectBlock)b {
    block = [b copy];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if (block) {
        block(rect);
    }
}

@end

@implementation UIView (Other)

- (void)setHeight:(CGFloat)val {
    CGRect frame = self.frame;
    frame.size.height = val;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)val {
    CGRect frame = self.frame;
    frame.size.width = val;
    self.frame = frame;
}

- (void)setLeft:(CGFloat)val {
    CGRect frame = self.frame;
    frame.origin.x = val;
    self.frame = frame;
}

- (void)setTop:(CGFloat)val {
    CGRect frame = self.frame;
    frame.origin.y = val;
    self.frame = frame;
}

- (CGFloat)width { return self.frame.size.width; }
- (CGFloat)height { return self.frame.size.height; }
- (CGFloat)left { return self.frame.origin.x; }
- (CGFloat)top { return self.frame.origin.y; }

+ (UIView *)viewWithFrame:(CGRect)frame drawRect:(DrawRectBlock)block {
    HCView *view = [[HCView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor clearColor];
    [view setDrawRectBlock:block];
    return [view autorelease];
}

@end

@implementation UIGestureRecognizer (Additions)

-(void)cancel {
    self.enabled = NO;
    self.enabled = YES;
}

@end

@implementation UINavigationController (PopOnSwipeRight)
@dynamic leftArrowView, distanceToDrag, numberOfTouches;

static CGPoint startPoint_;
static float DISTANCE_TO_DRAG = 100;
static float NUMBER_OF_TOUCHES = 2;
static UIView *LEFT_ARROW_INSTANCE = nil;

float clamp(float min, float max, float value) {
    return MIN(max, MAX(min, value));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNumberOfTouches:2];
    [self setDistanceToDrag:300];
}

- (void)panHandler:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count <= 1) {
        [gestureRecognizer cancel];
    }
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        startPoint_ = [gestureRecognizer locationInView:gestureRecognizer.view];
    }
    else if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint point = [gestureRecognizer locationInView:gestureRecognizer.view];
        float distance = point.x - startPoint_.x;
        if (distance > 0) {
            float progress = (distance / self.distanceToDrag);
            float left = (-self.leftArrowView.width)+(progress*self.leftArrowView.width);
            left = clamp(-self.leftArrowView.width, 0, left);
            
            self.leftArrowView.alpha = progress;
            self.leftArrowView.left = left;
        }
        else {
            
        }
    }
    else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint point = [gestureRecognizer locationInView:gestureRecognizer.view];
        float distance = point.x - startPoint_.x;
        float progress = (distance / DISTANCE_TO_DRAG);
        
        if (progress >= 1) {
            [self popViewControllerAnimated:YES];
        }
        
        uint flags = (UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionAllowUserInteraction);
        [UIView animateWithDuration:0.17 delay:0 options:flags animations:^{
            self.leftArrowView.alpha = 0;
            self.leftArrowView.left = -self.leftArrowView.width;
        } completion:nil];
    }
}

#pragma mark - Setters

- (void)setLeftArrowView:(UIView *)leftArrow {
    [LEFT_ARROW_INSTANCE release], LEFT_ARROW_INSTANCE = nil;
    LEFT_ARROW_INSTANCE = [leftArrow retain];
    self.leftArrowView.top = (self.view.height - self.leftArrowView.height) / 2;
    self.leftArrowView.left = -self.leftArrowView.width;
    
    [self.view addSubview:LEFT_ARROW_INSTANCE];
}

- (void)setNumberOfTouches:(int)numberOfTouches {
    for (UIGestureRecognizer *gestureRecognizer in self.view.gestureRecognizers) {
        if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
            if (gestureRecognizer.numberOfTouches == NUMBER_OF_TOUCHES) {
                [self.view removeGestureRecognizer:gestureRecognizer];
            }
        }
    }
    
    NUMBER_OF_TOUCHES = numberOfTouches;
    
    UIPanGestureRecognizer *panGestureRecognizer = [[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandler:)] autorelease];
    [panGestureRecognizer setMaximumNumberOfTouches:NUMBER_OF_TOUCHES];
    [panGestureRecognizer setMinimumNumberOfTouches:NUMBER_OF_TOUCHES];
    
    [self.view addGestureRecognizer:panGestureRecognizer];
}

- (void)setDistanceToDrag:(float)distanceToDrag {
    DISTANCE_TO_DRAG = distanceToDrag;
}

#pragma mark - Getters

- (UIView *)leftArrowView {
    return LEFT_ARROW_INSTANCE;
}

- (int)numberOfTouches {
    return NUMBER_OF_TOUCHES;
}

- (float)distanceToDrag {
    return DISTANCE_TO_DRAG;
}

@end
