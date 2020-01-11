//
//  ViewController+LoadView.m
//  Demo
//
//  Created by Deheng Xu on 2020/1/8.
//

#import "ViewController+LoadView.h"

#import <UIKit/UIKit.h>

//#import "NSLayoutConstraint+XALK.h"
#import "XAutoLayoutKit.h"
#import "UIView+XAutoLayoutKitEva.h"

@implementation ViewController (LoadView)

- (void)_loadViewsNewAPI {
    [self.objectOfReference setConstraintSize:CGSizeMake(200, 200)];
    [self.objectOfReference followCenterOfView:self.view];

    [self.v1 setConstraintSize:CGSizeMake(30, 30)];
    [self.v2 setConstraintSize:CGSizeMake(40, 40)];
    [self.v3 setConstraintSize:CGSizeMake(50, 50)];
    [self.v4 setConstraintSize:CGSizeMake(60, 60)];
}

- (void)_loadConstraintsNewAPI_A
{
    [self _loadViewsNewAPI];

    [self.v1 above:10 ofView:self.objectOfReference];
    [self.v1 followCenterXOfView:self.objectOfReference];

    [self.v2 after:10 ofView:self.objectOfReference];
    [self.v2 followCenterYOfView:self.objectOfReference];

    [self.v3 below:10 ofView:self.objectOfReference];
    [self.v3 followCenterXOfView:self.objectOfReference];

    [self.v4 ahead:10 ofView:self.objectOfReference];
    [self.v4 followCenterYOfView:self.objectOfReference];
}

- (void)_loadConstraintsNewAPI_B {
    [self _loadViewsNewAPI];
    NSLog(@"version: %@", kXAutoLayoutVersion);
    ///TODO: add layout
    [self.lineH followCenterXOfView:self.objectOfReference];
    //[self.lineH followY:-5.0 OfView:self.objectOfReference];
    [self.lineH above:5.0 ofView:self.objectOfReference];
    [self.lineH followWidthOfView:self.objectOfReference];
    [self.lineH setConstraintHeight:2.0];

    [self.lineV followCenterYOfView:self.objectOfReference];
    //[self.lineV followX:-5.0 OfView:self.objectOfReference];
    [self.lineV ahead:5.0 ofView:self.objectOfReference];
    [self.lineV followHeightOfView:self.objectOfReference];
    [self.lineV setConstraintWidth:2.0];
    
}

- (void)_loadConstraintsNewAPI_C
{
    //[self.v1 removeFromSuperview];
    [self.v2 removeFromSuperview];
    [self.v3 removeFromSuperview];
    [self.v4 removeFromSuperview];
    //[self.lineH removeFromSuperview];
    //[self.lineV removeFromSuperview];
    //[self.objectOfReference removeFromSuperview];
    self.lineV.backgroundColor = UIColor.greenColor;

    self.objectOfReference.xalkBinder.equal.centerX.to(self.view).centerX.xalkLayout();
    self.objectOfReference.xalkBinder.equal.centerY.to(self.view).centerY.xalkLayout();
    self.objectOfReference.xalkBinder.equal.width.multiply(0.4).to(self.view).width.xalkLayout();
    self.objectOfReference.xalkBinder.equal.height.multiply(0.4).to(self.view).height.xalkLayout();

    self.lineH.xalkBinder.equal.bottom.constant(-2.0).to(self.objectOfReference).top.xalkLayout();
    self.lineH.xalkBinder.left.equal.to(self.objectOfReference).left.xalkLayout();
    self.lineH.xalkBinder.width.equal.multiply(0.5).to(self.objectOfReference).width.xalkLayout();
        self.lineH.xalkBinder.height.multiply(1.0).constant(2.0).xalkLayout();

    self.lineV.xalkBinder.right.equal.constant(-2.0).to(self.objectOfReference).left.xalkLayout();
    self.lineV.xalkBinder.top.equal.to(self.objectOfReference).top.xalkLayout();
    self.lineV.xalkBinder.width.constant(2.0).xalkLayout();
    self.lineV.xalkBinder.height.multiply(0.5).equal.to(self.objectOfReference).height.xalkLayout();



#if 0 //API style B
    [self.objectOfReference followSize:^(ALKViewBinder * _Nonnull binder) {
        binder.toView = self.view;
        binder.multiplier = 0.5;
    }];
#endif
}

- (void)_loadConstraintsA
{
#if false
    NSDictionary *views = NSDictionaryOfVariableBindings(_v1, _v2, _v3, _v4, self.view, _objectOfReference);

    [NSLayoutConstraint setConstraintsWithView:self.objectOfReference size:CGSizeMake(200, 200)];
    [NSLayoutConstraint setConstraintsWithView:self.v1 size:CGSizeMake(30, 30)];
    [NSLayoutConstraint setConstraintsWithView:self.v2 size:CGSizeMake(40, 40)];
    [NSLayoutConstraint setConstraintsWithView:self.v3 size:CGSizeMake(50, 50)];
    [NSLayoutConstraint setConstraintsWithView:self.v4 size:CGSizeMake(60, 60)];
    [NSLayoutConstraint followViewCenter:self.view withView:self.objectOfReference];

    NSArray *constraints = nil;

    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_v1]-10-[_objectOfReference]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views];
    [self.view addConstraints:constraints];

    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[_objectOfReference]-10-[_v2]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views];
    [self.view addConstraints:constraints];

    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_objectOfReference]-(10)-[_v3]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views];
    [self.view addConstraints:constraints];

    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[_v4]-10-[_objectOfReference]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views];
    [self.view addConstraints:constraints];
#endif
}

// MARK: - NSLayoutConstraint+XALK

#if __has_include("NSLayoutConstraint+XALK")

/**
 Load constraint B

 https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/DebuggingTricksandTips.html

 */
- (void)_loadConstraintsB
{
    NSDictionary *views = NSDictionaryOfVariableBindings(_v1, _v2, _v3, _v4, self.view, _objectOfReference);

    [NSLayoutConstraint setConstraintsWithView:self.objectOfReference size:CGSizeMake(200, 200)];
    [NSLayoutConstraint setConstraintsWithView:self.v1 size:CGSizeMake(30, 30)];
    [NSLayoutConstraint setConstraintsWithView:self.v2 size:CGSizeMake(40, 40)];
    [NSLayoutConstraint setConstraintsWithView:self.v3 size:CGSizeMake(30, 30)];
    [NSLayoutConstraint setConstraintsWithView:self.v4 size:CGSizeMake(40, 40)];
    [NSLayoutConstraint followViewCenter:self.view withView:self.objectOfReference];

    NSArray *constraints = nil;
    id constraint = nil;

    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_v1]-0-[_objectOfReference]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views];
    [self.view addConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[_v1]-0-[_objectOfReference]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views];
    [self.view addConstraints:constraints];


//    constraint = [NSLayoutConstraint constraintWithItem:self.v1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.objectOfReference attribute:NSLayoutAttributeCenterX multiplier:1. constant:0];
//    [self.view addConstraint:constraint];
//    constraint = [NSLayoutConstraint constraintWithItem:self.v1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.objectOfReference attribute:NSLayoutAttributeCenterY multiplier:1. constant:0];
//    [self.view addConstraint:constraint];

}

- (void)_loadConstraintsXALKCategory
{
    [self.v1 setConstraintSize:CGSizeMake(30, 30)];
    [self.v2 setConstraintSize:CGSizeMake(40, 40)];
    [self.v3 setConstraintSize:CGSizeMake(30, 30)];
    [self.v4 setConstraintSize:CGSizeMake(40, 40)];

    [self.objectOfReference setConstraintSize:CGSizeMake(200, 200)];

    id constraint = nil;
    //Align v1 right side with left of objectOfReference and at center axis y.
    constraint = [NSLayoutConstraint constraintWithItem:self.v1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.objectOfReference attribute:NSLayoutAttributeLeft multiplier:1. constant:0];
    [self.view addConstraint:constraint];

    constraint = [NSLayoutConstraint constraintWithItem:self.v1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.objectOfReference attribute:NSLayoutAttributeCenterY multiplier:1. constant:0];
    [self.view addConstraint:constraint];

    //Align v2 with top of objectOfReference at center axis x of objectOfReference.
    constraint = [NSLayoutConstraint constraintWithItem:self.v2 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.objectOfReference attribute:NSLayoutAttributeTop multiplier:1. constant:0];
    [self.view addConstraint:constraint];

    constraint = [NSLayoutConstraint constraintWithItem:self.v2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.objectOfReference attribute:NSLayoutAttributeCenterX multiplier:1. constant:0];
    [self.view addConstraint:constraint];

    constraint = [NSLayoutConstraint constraintWithItem:self.v3 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.objectOfReference attribute:NSLayoutAttributeRight multiplier:1. constant:0];
    [self.view addConstraint:constraint];
    [NSLayoutConstraint followViewCenterY:self.objectOfReference withView:self.v3];

    constraint = [NSLayoutConstraint constraintWithItem:self.v4 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.objectOfReference attribute:NSLayoutAttributeBottom multiplier:1. constant:0];
    [self.view addConstraint:constraint];
    [NSLayoutConstraint followViewCenterX:self.objectOfReference withView:self.v4];


    //Set objectOfReference always at center of view.
    constraint = [NSLayoutConstraint constraintWithItem:self.objectOfReference attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1. constant:0];
    [self.view addConstraint:constraint];
    constraint = [NSLayoutConstraint constraintWithItem:self.objectOfReference attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1. constant:0];
    [self.view addConstraint:constraint];

}
#endif

@end
