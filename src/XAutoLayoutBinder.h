//
//  XAutoLayoutKitEva.h
//  XAutoLayoutKit
//
//  Created by Deheng Xu on 2020/1/11.
//

#ifndef XAutoLayoutKitEva_h
#define XAutoLayoutKitEva_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum: NSInteger {
    XALKActionInner,
    XALKActionAround,
    XALKActionFollow
} XALKAction;

typedef NS_ENUM(NSInteger, XALKAttribute) {
        XALKLayoutAttributeLeft = NSLayoutAttributeLeft,
        XALKLayoutAttributeRight,
        XALKLayoutAttributeTop,
        XALKLayoutAttributeBottom,
        XALKLayoutAttributeLeading,
        XALKLayoutAttributeTrailing,
        XALKLayoutAttributeWidth,
        XALKLayoutAttributeHeight,
        XALKLayoutAttributeCenterX,
        XALKLayoutAttributeCenterY,
        XALKLayoutAttributeLastBaseline,
    #if TARGET_OS_IPHONE
        XALKLayoutAttributeBaseline NS_SWIFT_UNAVAILABLE("Use 'lastBaseline' instead") = NSLayoutAttributeLastBaseline,
    #else
        XALKLayoutAttributeBaseline = NSLayoutAttributeLastBaseline,
    #endif
        XALKLayoutAttributeFirstBaseline API_AVAILABLE(macos(10.11), ios(8.0)),

    #if TARGET_OS_IPHONE
        XALKLayoutAttributeLeftMargin API_AVAILABLE(ios(8.0)),
        XALKLayoutAttributeRightMargin API_AVAILABLE(ios(8.0)),
        XALKLayoutAttributeTopMargin API_AVAILABLE(ios(8.0)),
        XALKLayoutAttributeBottomMargin API_AVAILABLE(ios(8.0)),
        XALKLayoutAttributeLeadingMargin API_AVAILABLE(ios(8.0)),
        XALKLayoutAttributeTrailingMargin API_AVAILABLE(ios(8.0)),
        XALKLayoutAttributeCenterXWithinMargins API_AVAILABLE(ios(8.0)),
        XALKLayoutAttributeCenterYWithinMargins API_AVAILABLE(ios(8.0)),
    #endif

        XALKLayoutAttributeNotAnAttribute = 0
};

typedef NS_ENUM(NSInteger, XALKRelation) {
    XALKLayoutRelationEqual = NSLayoutRelationEqual,
    XALKLayoutRelationLessThanOrEqual =  NSLayoutRelationLessThanOrEqual,
    XALKLayoutRelationGreaterThanOrEqual = NSLayoutRelationGreaterThanOrEqual
};

NS_ASSUME_NONNULL_BEGIN

/// Represent a constraint rule
@interface XALKAutoLayoutValue : NSObject

- (instancetype)equal;
- (instancetype)lessThanOrEqual;
- (instancetype)greatThanOrEqual;

- (instancetype)width;
- (instancetype)height;

- (instancetype)top;
- (instancetype)left;
- (instancetype)bottom;
- (instancetype)right;

- (instancetype)leading;
- (instancetype)trailing;

- (instancetype)centerX;
- (instancetype)centerY;

- (instancetype)to:(UIView *)view;

@end

@interface XALKViewBinder: NSObject

@property (nonatomic, assign) CGFloat multiplier;
@property (nonatomic, assign) CGFloat constants;

@property (nonatomic, readonly) XALKViewBinder * _Nonnull (^to)(UIView *view);

@property (nonatomic, readonly) void(^xalkLayout)();

// MARK: - Relation

@property (nonatomic, readonly, nonnull) XALKViewBinder * equal;
@property (nonatomic, readonly, nonnull) XALKViewBinder * lessThanOrEqual;
@property (nonatomic, readonly, nonnull) XALKViewBinder * greatThanOrEqual;

// MARK: - Attribute

@property (nonatomic, readonly) XALKViewBinder * width;
@property (nonatomic, readonly) XALKViewBinder * height;

@property (nonatomic, readonly) XALKViewBinder * centerX;
@property (nonatomic, readonly) XALKViewBinder * centerY;
@property (nonatomic, readonly) XALKViewBinder * leading;
@property (nonatomic, readonly) XALKViewBinder * trailing;

@property (nonatomic, readonly) XALKViewBinder * top;
@property (nonatomic, readonly) XALKViewBinder * left;
@property (nonatomic, readonly) XALKViewBinder * bottom;
@property (nonatomic, readonly) XALKViewBinder * right;

@property (nonatomic, readonly) XALKViewBinder *(^multiply)(CGFloat multiplier);
@property (nonatomic, readonly) XALKViewBinder *(^constant)(CGFloat constants);

@end

@interface UIView (XAutoLayoutKitEva)

@property (nonatomic, readonly) XALKViewBinder *xalkBinder;
- (XALKViewBinder *)xalkBinder;

@end

NS_ASSUME_NONNULL_END

#endif /* XAutoLayoutKitEva_h */