
//
//  LocalizedEngine.m
//  xgoods
//
//  Created by admin on 2017/1/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "LocalizedEngine.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#define LocalizedString(string) NSLocalizedString(string, nil)

@interface NSObject (LocalizedEngineSwizzling)

@end
@implementation NSObject (LocalizedEngineSwizzling)

+ (BOOL)les_swizzleMethod:(SEL)origSel withMethod:(SEL)altSel {
    Method origMethod = class_getInstanceMethod(self, origSel);
    Method altMethod = class_getInstanceMethod(self, altSel);
    if (!origMethod || !altMethod) {
        return NO;
    }
    class_addMethod(self,
                    origSel,
                    class_getMethodImplementation(self, origSel),
                    method_getTypeEncoding(origMethod));
    class_addMethod(self,
                    altSel,
                    class_getMethodImplementation(self, altSel),
                    method_getTypeEncoding(altMethod));
    method_exchangeImplementations(class_getInstanceMethod(self, origSel),
                                   class_getInstanceMethod(self, altSel));
    return YES;
}

+ (BOOL)les_swizzleClassMethod:(SEL)origSel withMethod:(SEL)altSel {
    return [object_getClass((id)self) les_swizzleMethod:origSel withMethod:altSel];
}

@end

@interface NSAttributedString (LocalizedEngine)

@end
@implementation NSAttributedString (LocalizedEngine)

- (instancetype)le_initWithString:(NSString *)str{
    return [self le_initWithString:LocalizedString(str)];
}
- (instancetype)le_initWithString:(NSString *)str attributes:(nullable NSDictionary<NSString *, id> *)attrs{
    return [self le_initWithString:LocalizedString(str) attributes:attrs];
}

@end

@interface NSString (LocalizedEngine)

@end

@implementation NSString(LocalizedEngine)

-(CGRect)le_boundingRectWithSize:(CGSize)size options:(NSStringDrawingOptions)options attributes:(nullable NSDictionary<NSString *, id> *)attributes context:(nullable NSStringDrawingContext *)context{
    return [LocalizedString(self) le_boundingRectWithSize:size options:options attributes:attributes context:context];
}

- (CGSize)le_sizeWithAttributes:(nullable NSDictionary<NSString *, id> *)attrs{
    return [LocalizedString(self) le_sizeWithAttributes:attrs];
}
@end

@interface UILabel (LocalizedEngine)

@end

@implementation UILabel(LocalizedEngine)

-(void)le_setText:(NSString *)text{
    [self le_setText:LocalizedString(text)];
}

@end

@interface UITabBarItem (LocalizedEngine)

@end
@implementation UITabBarItem (LocalizedEngine)

-(void)le_setTitle:(NSString *)title{
    [self le_setTitle:LocalizedString(title)];
}

@end

@interface UINavigationItem (LocalizedEngine)

@end
@implementation UINavigationItem (LocalizedEngine)

-(void)le_setTitle:(NSString *)title{
    [self le_setTitle:LocalizedString(title)];
}

@end
@interface UIViewController (LocalizedEngine)

@end
@implementation UIViewController (LocalizedEngine)

-(void)le_setTitle:(NSString *)title{
    [self le_setTitle:LocalizedString(title)];
}

@end

@interface UIButton (LocalizedEngine)

@end
@implementation UIButton (LocalizedEngine)

-(void)le_setTitle:(NSString *)title forState:(UIControlState)state{
    [self le_setTitle:LocalizedString(title) forState:state];
}

@end

@interface UITextField (LocalizedEngine)

@end
@implementation UITextField (LocalizedEngine)

-(void)le_setText:(NSString *)text{
    [self le_setText:LocalizedString(text)];
}

-(void)le_setPlaceholder:(NSString *)placeholder{
    [self le_setPlaceholder:LocalizedString(placeholder)];
}

@end

@interface UITextView (LocalizedEngine)

@end
@implementation UITextView (LocalizedEngine)

-(void)le_setText:(NSString *)text{
    [self le_setText:LocalizedString(text)];
}

@end

@implementation LocalizedEngine

+(void)startEngine{
    [[UITextField class] les_swizzleMethod:@selector(setText:) withMethod:@selector(le_setText:)];
    [[UITextField class] les_swizzleMethod:@selector(setPlaceholder:) withMethod:@selector(le_setPlaceholder:)];
    [[UITextView class] les_swizzleMethod:@selector(setText:) withMethod:@selector(le_setText:)];
    [[UILabel class] les_swizzleMethod:@selector(setText:) withMethod:@selector(le_setText:)];
    [[UITabBarItem class] les_swizzleMethod:@selector(setTitle:) withMethod:@selector(le_setTitle:)];
    [[UINavigationItem class] les_swizzleMethod:@selector(setTitle:) withMethod:@selector(le_setTitle:)];
    [[UIViewController class] les_swizzleMethod:@selector(setTitle:) withMethod:@selector(le_setTitle:)];
    [[UIButton class] les_swizzleMethod:@selector(setTitle:forState:) withMethod:@selector(le_setTitle:forState:)];
    [[NSString class] les_swizzleMethod:@selector(boundingRectWithSize:options:attributes:context:) withMethod:@selector(le_boundingRectWithSize:options:attributes:context:)];
    [[NSString class] les_swizzleMethod:@selector(sizeWithAttributes:) withMethod:@selector(le_sizeWithAttributes:)];
    [[NSAttributedString class] les_swizzleMethod:@selector(initWithString:) withMethod:@selector(le_initWithString:)];
    [[NSAttributedString class] les_swizzleMethod:@selector(initWithString:attributes:) withMethod:@selector(le_initWithString:attributes:)];

}

@end
