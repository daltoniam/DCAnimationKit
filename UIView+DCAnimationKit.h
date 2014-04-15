//////////////////////////////////////////////////////////////////////////////////////
//
//  UIView+AnimationKit.h
//
//  Created by Dalton Cherry on 3/20/14.
//
//////////////////////////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

typedef void (^DCAnimationFinished)(void);

@interface UIView (DCAnimationKit)

///-------------------------------
/// @name coordinate manipulation
///-------------------------------

/**
 set the x location you want the view to set
 @param x is the x coordinate you want to set.
 @param time is the duration of the animation.
 @param finished is called when the animation finishes
*/
-(void)setX:(CGFloat)x duration:(NSTimeInterval)time finished:(DCAnimationFinished)finished;

/**
 set the x location you want the view to move to.
 @param x is the x coordinate you want to move to.
 @param finished is called when the animation finishes
*/
-(void)setX:(CGFloat)x finished:(DCAnimationFinished)finished;

/**
 move the x location (e.g. the x of the view's frame is 200 and x is 50, 
 then the x coordinate of the view's frame will be 250).
 @param x is the offset of the x coordinate you want to move by.
 @param time is the duration of the animation.
 @param finished is called when the animation finishes
 */
-(void)moveX:(CGFloat)x duration:(NSTimeInterval)time finished:(DCAnimationFinished)finished;

/**
 move the x location (e.g. the x of the view's frame is 200 and x is 50,
 then the x coordinate of the view's frame will be 250).
 @param x is the offset of the x coordinate you want to move by.
 @param finished is called when the animation finishes
 */
-(void)moveX:(CGFloat)x finished:(DCAnimationFinished)finished;

/**
 set the y location you want the view to set
 @param y is the x coordinate you want to set.
 @param time is the duration of the animation.
 @param finished is called when the animation finishes
 */
-(void)setY:(CGFloat)y duration:(NSTimeInterval)time finished:(DCAnimationFinished)finished;

/**
 set the y location you want the view to set
 @param y is the y coordinate you want to set.
 @param finished is called when the animation finishes
 */
-(void)setY:(CGFloat)y finished:(DCAnimationFinished)finished;

/**
 move the y location (e.g. the y of the view's frame is 200 and y is 50,
 then the y coordinate of the view's frame will be 250).
 @param y is the offset of the y coordinate you want to move by.
 @param time is the duration of the animation.
 @param finished is called when the animation finishes
 */
-(void)moveY:(CGFloat)y duration:(NSTimeInterval)time finished:(DCAnimationFinished)finished;

/**
 move the y location (e.g. the y of the view's frame is 200 and y is 50,
 then the y coordinate of the view's frame will be 250).
 @param y is the offset of the y coordinate you want to move by.
 @param finished is called when the animation finishes
 */
-(void)moveY:(CGFloat)y finished:(DCAnimationFinished)finished;

/**
 set the point you want the view to set to.
 @param point is the x and y coordinate you want to set.
 @param time is the duration of the animation.
 @param finished is called when the animation finishes
 */
-(void)setPoint:(CGPoint)point duration:(NSTimeInterval)time finished:(DCAnimationFinished)finished;

/**
 set the point you want the view to set to.
 @param point is the x and y coordinate you want to set.
 @param finished is called when the animation finishes
 */
-(void)setPoint:(CGPoint)point finished:(DCAnimationFinished)finished;

/**
 move the x and y location (e.g. x,y is 10,20 and the point is 30,30,
 then the x and y coordinates of the view's frame will be 40,50).
 @param point is the offset of the x,y coordinates you want to move by.
 @param time is the duration of the animation.
 @param finished is called when the animation finishes
 */
-(void)movePoint:(CGPoint)point duration:(NSTimeInterval)time finished:(DCAnimationFinished)finished;

/**
 move the x and y location (e.g. x,y is 10,20 and the point is 30,30,
 then the x and y coordinates of the view's frame will be 40,50).
 @param point is the offset of the x,y coordinates you want to move by.
 @param finished is called when the animation finishes
 */
-(void)movePoint:(CGPoint)point finished:(DCAnimationFinished)finished;


/**
 set the degrees of rotation on the view
 @param r is the degrees you want the view to be rotated by. This would be a value between 0 and 360.
 @param time is the duration of the animation.
 @param finished is called when the animation finishes
 */
-(void)setRotation:(CGFloat)r duration:(NSTimeInterval)time finished:(DCAnimationFinished)finished;

/**
 set the degrees of rotation on the view
 @param r is the degrees you want the view to be rotated by. This would be a value between 0 and 360.
 @param finished is called when the animation finishes
 */
-(void)setRotation:(CGFloat)r finished:(DCAnimationFinished)finished;

/**
 move the view by a degree of rotation
 @param r is the degrees you want the view to be rotated by. This would be a value between 0 and 360.
 @param time is the duration of the animation.
 @param finished is called when the animation finishes
 */
-(void)moveRotation:(CGFloat)r duration:(NSTimeInterval)time finished:(DCAnimationFinished)finished;

/**
 move the view by a degree of rotation
 @param r is the degrees you want the view to be rotated by. This would be a value between 0 and 360.
 @param finished is called when the animation finishes
 */
-(void)moveRotation:(CGFloat)r finished:(DCAnimationFinished)finished;

///-------------------------------
/// @name Attention grabbers
///-------------------------------

/**
 preform the bounce animation.
 @param finished is called when the animation finishes
 */
-(void)bounce:(DCAnimationFinished)finished;

/**
 preform the bounce animation.
 @param height is how many px to bounce up by. Default is 10.
 @param finished is called when the animation finishes
 */
-(void)bounce:(CGFloat)height finished:(DCAnimationFinished)finished;

/**
 preform the pulse animation.
 @param finished is called when the animation finishes
 */
-(void)pulse:(DCAnimationFinished)finished;

/**
 preform the shake animation.
 @param finished is called when the animation finishes
 */
-(void)shake:(DCAnimationFinished)finished;

/**
 preform the swing animation.
 @param finished is called when the animation finishes
 */
-(void)swing:(DCAnimationFinished)finished;

/**
 preform the tada animation.
 @param finished is called when the animation finishes
 */
-(void)tada:(DCAnimationFinished)finished;


///-------------------------------
/// @name Intros
///-------------------------------

typedef NS_ENUM(NSInteger, DCAnimationDirection) {
    DCAnimationDirectionTop,
    DCAnimationDirectionBottom,
    DCAnimationDirectionLeft,
    DCAnimationDirectionRight
};

/**
 The view enters from a direction and snaps into place.
 @param view is the superview you want to snap into. It will add itself as a subview of view.
 @param direction is the direction to enter from.
 */
-(void)snapIntoView:(UIView*)view direction:(DCAnimationDirection)direction;

/**
 The view enters from a direction and bounce into place.
 @param view is the superview you want to bounce into. It will add itself as a subview of view.
 @param direction is the direction to enter from.
 */
-(void)bounceIntoView:(UIView*)view direction:(DCAnimationDirection)direction;

/**
 The view expands into it's frame place.
 @param view is the superview you want to expand into. It will add itself as a subview of view.
 @param finished is called when the animation finishes
 */
-(void)expandIntoView:(UIView*)view finished:(DCAnimationFinished)finished;


///-------------------------------
/// @name Outros
///-------------------------------

/**
 The view compress into it's frame place.
 @param finished is called when the animation finishes
 */
-(void)compressIntoView:(DCAnimationFinished)finished;

/**
 The view hinges and falls off screen.
 @param finished is called when the animation finishes
 */
-(void)hinge:(DCAnimationFinished)finished;

/**
 The view will drop based on gravity.
 @param finished is called when the animation finishes
 */
-(void)drop:(DCAnimationFinished)finished;

/**
 Remove the current animator animations applied.
 */
-(void)removeCurrentAnimations;


@end
