//////////////////////////////////////////////////////////////////////////////////////
//
//  UIView+AnimationKit.m
//
//  Created by Dalton Cherry on 3/20/14.
//
//////////////////////////////////////////////////////////////////////////////////////

#import "UIView+DCAnimationKit.h"
#import <objc/runtime.h>

@interface UIImageView (DCAnimationKit)
@property (readwrite, nonatomic, strong, setter = dc_supAnimator:)UIDynamicAnimator *dc_supAnimator;
@end

@implementation UIView (DCAnimationKit)

static NSTimeInterval DEFAULT_DURATION = 0.25;

//////////////////////////////////////////////////////////////////////////////////////
- (UIDynamicAnimator*)dc_animator {
    return [self.superview dc_supAnimator];
}
//////////////////////////////////////////////////////////////////////////////////////
- (UIDynamicAnimator*)dc_supAnimator {
    
    UIDynamicAnimator *animator = (UIDynamicAnimator*)objc_getAssociatedObject(self, @selector(dc_supAnimator));
    if(!animator)
    {
        animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
        [self dc_setSupAnimator:animator];
    }
    return animator;
}
//////////////////////////////////////////////////////////////////////////////////////
- (void)dc_setSupAnimator:(UIDynamicAnimator*)animator {
    objc_setAssociatedObject(self, @selector(dc_supAnimator), animator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
//////////////////////////////////////////////////////////////////////////////////////
CGFloat degreesToRadians(CGFloat degrees)
{
    return degrees * M_PI / 180;
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)setDirection:(DCAnimationDirection)direction
{
    //these need to be more accurate
    CGRect frame = self.frame;
    if(direction == DCAnimationDirectionBottom)
        frame.origin.y = self.window.frame.size.height;
    else if(direction == DCAnimationDirectionTop)
        frame.origin.y = -self.window.frame.size.height;
    else if(direction == DCAnimationDirectionLeft)
        frame.origin.x = -self.window.frame.size.width;
    else {
        CGFloat offset = self.window.frame.size.width;
        if([self.superview isKindOfClass:[UIScrollView class]]) {
            UIScrollView *view = (UIScrollView*)self.superview;
            offset = view.contentSize.width;
        }
        frame.origin.x = offset;
    }
    self.frame = frame;
}
//////////////////////////////////////////////////////////////////////////////////////
-(CGVector)vectorDirection:(DCAnimationDirection)direction
{
    if(direction == DCAnimationDirectionBottom)
        return CGVectorMake(0, -1);
    else if(direction == DCAnimationDirectionTop)
        return CGVectorMake(0, 1);
    else if(direction == DCAnimationDirectionLeft)
        return CGVectorMake(1, 0);
    else
        return CGVectorMake(-1, 0);
}
//////////////////////////////////////////////////////////////////////////////////////

#pragma general movements

//////////////////////////////////////////////////////////////////////////////////////
-(void)setX:(CGFloat)x finished:(DCAnimationFinished)finished
{
    [self setX:x duration:DEFAULT_DURATION finished:finished];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)setX:(CGFloat)x duration:(NSTimeInterval)time finished:(DCAnimationFinished)finished
{
    [UIView animateWithDuration:time animations:^{
        CGRect frame = self.frame;
        frame.origin.x = x;
        self.frame = frame;
    } completion:^(BOOL f){
        if(finished)
            finished();
    }];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)moveX:(CGFloat)x duration:(NSTimeInterval)time finished:(DCAnimationFinished)finished
{
    [self setX:(self.frame.origin.x+x) duration:time finished:finished];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)moveX:(CGFloat)x finished:(DCAnimationFinished)finished
{
    [self moveX:x duration:DEFAULT_DURATION finished:finished];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)setY:(CGFloat)y duration:(NSTimeInterval)time finished:(DCAnimationFinished)finished
{
    [UIView animateWithDuration:time animations:^{
        CGRect frame = self.frame;
        frame.origin.y = y;
        self.frame = frame;
    }completion:^(BOOL f){
        if(finished)
            finished();
    }];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)setY:(CGFloat)y finished:(DCAnimationFinished)finished
{
    [self setY:y duration:DEFAULT_DURATION finished:finished];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)moveY:(CGFloat)y duration:(NSTimeInterval)time finished:(DCAnimationFinished)finished
{
    [self setY:(self.frame.origin.y+y) duration:time finished:finished];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)moveY:(CGFloat)y finished:(DCAnimationFinished)finished
{
    [self moveY:y duration:DEFAULT_DURATION finished:finished];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)setPoint:(CGPoint)point duration:(NSTimeInterval)time finished:(DCAnimationFinished)finished
{
    [UIView animateWithDuration:time animations:^{
        CGRect frame = self.frame;
        frame.origin = point;
        self.frame = frame;
    }completion:^(BOOL f){
        if(finished)
            finished();
    }];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)setPoint:(CGPoint)point finished:(DCAnimationFinished)finished
{
    [self setPoint:point finished:finished];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)movePoint:(CGPoint)point duration:(NSTimeInterval)time finished:(DCAnimationFinished)finished
{
    [self setPoint:CGPointMake(self.frame.origin.x+point.x, self.frame.origin.y+point.y) duration:time finished:finished];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)movePoint:(CGPoint)point finished:(DCAnimationFinished)finished
{
    [self movePoint:point duration:DEFAULT_DURATION finished:finished];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)setRotation:(CGFloat)r duration:(NSTimeInterval)time finished:(DCAnimationFinished)finished
{
    [UIView animateWithDuration:time animations:^{
        CGAffineTransform rotationTransform = CGAffineTransformIdentity;
        self.transform = CGAffineTransformRotate(rotationTransform, degreesToRadians(r));
    } completion:^(BOOL f){
        if(finished)
            finished();
    }];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)setRotation:(CGFloat)r finished:(DCAnimationFinished)finished
{
    [self setRotation:r duration:DEFAULT_DURATION finished:finished];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)moveRotation:(CGFloat)r duration:(NSTimeInterval)time finished:(DCAnimationFinished)finished
{
    [UIView animateWithDuration:time animations:^{
        CGAffineTransform rotationTransform = self.transform;
        self.transform = CGAffineTransformRotate(rotationTransform, degreesToRadians(r));
    } completion:^(BOOL f){
        if(finished)
            finished();
    }];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)moveRotation:(CGFloat)r finished:(DCAnimationFinished)finished
{
    [self moveRotation:r duration:DEFAULT_DURATION finished:finished];
}
//////////////////////////////////////////////////////////////////////////////////////

#pragma attention grabbers

//////////////////////////////////////////////////////////////////////////////////////
-(void)bounce:(DCAnimationFinished)finished
{
    [self bounce:10 finished:finished];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)bounce:(CGFloat)height finished:(DCAnimationFinished)finished
{
    UIDynamicAnimator *animator = [self dc_animator];
    [animator removeAllBehaviors];
    [self moveY:-height duration:0.25 finished:^{
        [self moveY:height duration:0.15 finished:^{
            [self moveY:-(height/2) duration:0.15 finished:^{
                [self moveY:height/2 duration:0.05 finished:^{
                    if(finished)
                        finished();
                }];
            }];
        }];
    }];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)pulse:(DCAnimationFinished)finished
{
    [UIView animateWithDuration:0.5 animations:^{
        self.transform = CGAffineTransformMakeScale(1.1, 1.1);
    } completion:^(BOOL f){
        [UIView animateWithDuration:0.5 delay:0.1 options:0 animations:^{
            self.transform = CGAffineTransformMakeScale(1, 1);
        } completion:^(BOOL f){
            if(finished)
                finished();
        }];
    }];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)shake:(DCAnimationFinished)finished
{
    float dist = 10;
    [self moveX:-dist duration:0.15 finished:^{
        [self moveX:dist*2 duration:0.15 finished:^{
            [self moveX:-(dist*2) duration:0.15 finished:^{
                [self moveX:dist duration:0.15 finished:^{
                    if(finished)
                        finished();
                }];
            }];
        }];
    }];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)swing:(DCAnimationFinished)finished
{
    float dist = 15;
    float dur = 0.20;
    __weak id weakSelf = self;
    [weakSelf setRotation:dist duration:dur finished:^{
        [weakSelf setRotation:-dist duration:dur finished:^{
            [weakSelf setRotation:dist/2 duration:dur finished:^{
                [weakSelf setRotation:-dist/2 duration:dur finished:^{
                    [weakSelf setRotation:0 duration:dur finished:^{
                        if(finished)
                            finished();
                    }];
                }];
            }];
        }];
    }];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)tada:(DCAnimationFinished)finished
{
    float dist = 3;
    float dur = 0.12;
    [UIView animateWithDuration:dur animations:^{
        CGAffineTransform rotationTransform = CGAffineTransformMakeScale(0.95, 0.95);
        rotationTransform = CGAffineTransformRotate(rotationTransform, degreesToRadians(dist));
        self.transform = rotationTransform;
    } completion:^(BOOL f){
        [UIView animateWithDuration:dur animations:^{
            CGAffineTransform rotationTransform = CGAffineTransformMakeScale(1.05, 1.05);
            rotationTransform = CGAffineTransformRotate(rotationTransform, degreesToRadians(-dist));
            self.transform = rotationTransform;
        } completion:^(BOOL f){
            
            __weak id weakSelf = self;
            [weakSelf moveRotation:dist*2 duration:dur finished:^{
                [weakSelf moveRotation:-dist*2 duration:dur finished:^{
                    [weakSelf moveRotation:dist*2 duration:dur finished:^{
                        [weakSelf moveRotation:-dist*2 duration:dur finished:^{
                            [UIView animateWithDuration:dur animations:^{
                                CGAffineTransform rotationTransform = CGAffineTransformMakeScale(1, 1);
                                rotationTransform = CGAffineTransformRotate(rotationTransform, degreesToRadians(0));
                                self.transform = rotationTransform;
                            } completion:^(BOOL f){
                                if(finished)
                                    finished();
                            }];
                        }];
                    }];
                }];
            }];
            
        }];
    }];
}
//////////////////////////////////////////////////////////////////////////////////////

#pragma intros

//////////////////////////////////////////////////////////////////////////////////////
-(void)removeCurrentAnimations
{
    UIDynamicAnimator *animator = [self dc_animator];
    [animator removeAllBehaviors];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)snapIntoView:(UIView*)view direction:(DCAnimationDirection)direction
{
    if(self.superview != view)
        [self removeFromSuperview];
    [view addSubview:self];
    UIDynamicAnimator *animator = [self dc_animator];
    if(!animator.isRunning)
        [animator removeAllBehaviors];
    
    UISnapBehavior *snapBehaviour = [[UISnapBehavior alloc] initWithItem:self snapToPoint:self.center];
    [self setDirection:direction];
    snapBehaviour.damping = 0.75f;
    [animator addBehavior:snapBehaviour];
    
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)bounceIntoView:(UIView*)view direction:(DCAnimationDirection)direction
{
    if(self.superview != view)
        [self removeFromSuperview];
    [view addSubview:self];
    UIDynamicAnimator *animator = [self dc_animator];
    if(!animator.isRunning)
        [animator removeAllBehaviors];
    
    UIAttachmentBehavior *behavior = [[UIAttachmentBehavior alloc] initWithItem:self attachedToAnchor:self.center];
    [self setDirection:direction];
    behavior.length = 0;
    behavior.damping = 0.55;
    behavior.frequency = 1.0;
    [animator addBehavior:behavior];
    
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)expandIntoView:(UIView *)view finished:(DCAnimationFinished)finished
{
    if(self.superview != view)
        [self removeFromSuperview];
    [view addSubview:self];
    
    self.transform = CGAffineTransformMakeScale(0, 0);
    self.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL f){
        if(finished)
            finished();
    }];
}
//////////////////////////////////////////////////////////////////////////////////////

#pragma outros

//////////////////////////////////////////////////////////////////////////////////////
-(void)compressIntoView:(DCAnimationFinished)finished
{
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeScale(0, 0);
    } completion:^(BOOL f){
        self.hidden = YES;
        if(finished)
            finished();
    }];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)hinge:(DCAnimationFinished)finished
{
    UIDynamicAnimator *animator = [self dc_animator];
    [animator removeAllBehaviors];
    CGPoint point = CGPointMake(self.frame.origin.x, self.frame.origin.y);
    self.layer.anchorPoint = CGPointMake(0, 0);
    self.center = point;
    __weak UIView *weakSelf = self;
    float dur = 0.5;
    [weakSelf setRotation:80 duration:dur finished:^{
        [weakSelf setRotation:70 duration:dur finished:^{
            [weakSelf setRotation:80 duration:dur finished:^{
                [weakSelf setRotation:70 duration:dur finished:^{
                    [self moveY:weakSelf.window.frame.size.height duration:dur finished:^{
                        [self removeFromSuperview];
                        if(finished)
                            finished();
                        [weakSelf setRotation:0 finished:NULL];
                    }];
                }];
            }];
        }];
    }];
}
//////////////////////////////////////////////////////////////////////////////////////
-(void)drop:(DCAnimationFinished)finished
{
    UIDynamicAnimator *animator = [self dc_animator];
    if(!animator.isRunning) {
        [animator removeAllBehaviors];
    }
    
    UIGravityBehavior *gravityBehaviour = [[UIGravityBehavior alloc] initWithItems:@[self]];
    gravityBehaviour.gravityDirection = CGVectorMake(0.0f, 10.0f);
    [animator addBehavior:gravityBehaviour];
    
    UIDynamicItemBehavior *itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[self]];
    [itemBehaviour addAngularVelocity:-M_PI_2 forItem:self];
    [animator addBehavior:itemBehaviour];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL f){
        [self removeFromSuperview];
        if(finished)
            finished();
    }];
}
//////////////////////////////////////////////////////////////////////////////////////

@end
