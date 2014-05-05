//
//  PBView.m
//  ProgressBars
//
//  Created by Ming-Zhe on 14-5-3.
//  Copyright (c) 2014年 Ming-Zhe. All rights reserved.
//

#import "PBView.h"
#import <QuartzCore/QuartzCore.h>


@interface PBViewLayer : CALayer
@property (nonatomic, strong) UIColor* progressColor;
@property (nonatomic) CGFloat progress;
@end

@implementation PBViewLayer

@dynamic progressColor;

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    return [key isEqualToString:@"progress"] ? YES : [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)context
{
    
    NSInteger int_progress = (int)roundf(self.progress * 100);
    NSString *text = [NSString stringWithFormat:@"%li%%", int_progress];
    const char * c_text = [text UTF8String];
//    CGRect rect = CGRectInset(self.bounds, kBorderWidth, kBorderWidth);
//    CGFloat radius = CGRectGetHeight(rect) / 2.0f;
//    CGContextSetLineWidth(context, kBorderWidth);
//    CGContextSetStrokeColorWithColor(context, self.borderTintColor.CGColor);
//    [self drawRectangleInContext:context inRect:rect withRadius:radius];
//    CGContextStrokePath(context);
//    
//    
//    CGContextSetFillColorWithColor(context, self.progressTintColor.CGColor);
//    CGRect progressRect = CGRectInset(rect, 2 * kBorderWidth, 2 * kBorderWidth);
//    CGFloat progressRadius = CGRectGetHeight(progressRect) / 2.0f;
//    progressRect.size.width = fmaxf(self.progress * progressRect.size.width, 2.0f * progressRadius);
//    [self drawRectangleInContext:context inRect:progressRect withRadius:progressRadius];
//    CGContextFillPath(context);
    
    
    CGRect barRect = CGRectInset(self.bounds, 0, 2.0f);
    CGFloat maxWidth = barRect.size.width;
    CGFloat textWidth = 5.0 + strlen(c_text) * 5.0 + 10.0 + 5.0;

    barRect.size.width = self.progress * barRect.size.width;
    CGContextSetRGBFillColor(context, 220.0/255.0f, 220.0/255.0f, 220.0/255.0f, 1.0f);
    CGContextMoveToPoint(context, barRect.origin.x + maxWidth, barRect.origin.y);
    CGContextAddLineToPoint(context, barRect.origin.x + maxWidth, barRect.origin.y
                            + barRect.size.height);
    CGContextAddLineToPoint(context, barRect.origin.x + barRect.size.width + textWidth, barRect.origin.y + barRect.size.height);
    CGContextAddLineToPoint(context, barRect.origin.x + barRect.size.width + textWidth, barRect.origin.y);
    CGContextAddLineToPoint(context, barRect.origin.x + maxWidth, barRect.origin.y);
    CGContextFillPath(context);
    
//    CGContextShowTextAtPoint(context, barRect.origin.x + barRect.size.width, barRect.origin.y, "TEST", 4);

//    [@"TEST" drawAtPoint:CGPointMake(barRect.origin.x, barRect.origin.y) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:16]}];
    
    
    CGRect progressRect = CGRectInset(self.bounds, 0, 2.0f);
    progressRect.size.width = self.progress * progressRect.size.width;
    CGContextSetFillColorWithColor(context, self.progressColor.CGColor);
    CGContextMoveToPoint(context, progressRect.origin.x, progressRect.origin.y);
    CGContextAddLineToPoint(context, progressRect.origin.x, progressRect.origin.y
                            + progressRect.size.height);
    CGContextAddLineToPoint(context, MIN(progressRect.origin.x + progressRect.size.width, maxWidth - textWidth), progressRect.origin.y + progressRect.size.height);
    CGContextAddLineToPoint(context, MIN(progressRect.origin.x + progressRect.size.width, maxWidth - textWidth), progressRect.origin.y);
    CGContextAddLineToPoint(context, progressRect.origin.x, progressRect.origin.y);
    CGContextFillPath(context);
    
    
    CGRect textRect = self.bounds;
    CGFloat current = self.progress * textRect.size.width;
//    CGContextSetRGBFillColor(context, 0/255.0f, 0/255.0f, 220.0/255.0f, 1.0f);
//    CGContextMoveToPoint(context, MIN(current + 5, maxWidth - 20), textRect.origin.y - 2);
//    CGContextAddLineToPoint(context, MIN(current + 5, maxWidth - 20), textRect.origin.y + textRect.size.height + 2);
//    CGContextAddLineToPoint(context, MIN(current + 25, maxWidth), textRect.origin.y + textRect.size.height + 2);
//    CGContextAddLineToPoint(context, MIN(current + 25, maxWidth), textRect.origin.y - 2);
//    CGContextAddLineToPoint(context, MIN(current + 5, maxWidth - 20), textRect.origin.y - 2);
//    CGContextFillPath(context);
    
//    CGFloat blue[] = {0.0, 0.0, 1.0, 1.0};
//    CGContextSetFillColor(context, blue);
//    CGContextFillRect(context, [self bounds]);
    CGContextSetTextDrawingMode(context, kCGTextStroke);
    CGContextSetRGBFillColor(context, 0.0, 1.0, 0.0, 1.0);
    CGContextSelectFont(context, "HelveticaNeue-UltraLight", 12.0, kCGEncodingMacRoman);
    CGAffineTransform transform = CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0);
    CGContextSetTextMatrix(context, transform);
    CGContextShowTextAtPoint(context, MIN(textRect.origin.x + current + 5, maxWidth - textWidth), textRect.origin.y + (CGRectGetHeight(textRect)), c_text, strlen(c_text));
    
//    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
//    NSString *text = @"TEST";
//    [self drawText:text x:barRect.origin.x + 100 y:barRect.origin.y];
//    CGContextFillPath(context);
    
}



//- (void) drawText:(NSString *)text x:(float)x y:(float)y {
//    //UIFont *font = [UIFont fontWithName:@"Arial" size:20];
//    [text drawAtPoint:CGPointMake(x, y) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:16]}];
//}
//- (void) drawText:(NSString *)text x:(float)x y:(float)y {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSelectFont(context, "Arial", 20, kCGEncodingMacRoman);
//    CGContextSetTextDrawingMode(context, kCGTextFill);
//    CGAffineTransform xform = CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0);
//    CGContextSetTextMatrix(context, xform);
//    CGContextSetTextPosition(context, x, y+20); // 20 is y-axis offset pixels
//    CGContextShowText(context, [text UTF8String], strlen([text UTF8String]));
//}

@end


@implementation PBView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    self.backgroundColor = [UIColor clearColor];
}

- (void)didMoveToWindow
{
    self.progressLayer.contentsScale = self.window.screen.scale;
}

+ (Class)layerClass
{
    return [PBViewLayer class];
}

- (PBViewLayer *)progressLayer
{
    return (PBViewLayer *)self.layer;
}


#pragma mark Getters & Setters

- (CGFloat)progress
{
    return self.progressLayer.progress;
}

- (void)setProgress:(CGFloat)progress
{
    [self setProgress:progress animated:NO];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    [self.progressLayer removeAnimationForKey:@"progress"];
    CGFloat pinnedProgress = MIN(MAX(progress, 0.0f), 1.0f);
    
    if (animated) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
        animation.duration = fabsf(self.progress - pinnedProgress) + 0.1f;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.fromValue = [NSNumber numberWithFloat:self.progress];
        animation.toValue = [NSNumber numberWithFloat:pinnedProgress];
        [self.progressLayer addAnimation:animation forKey:@"progress"];
    }
    else {
        [self.progressLayer setNeedsDisplay];
    }
    
    self.progressLayer.progress = pinnedProgress;
}

- (UIColor *)progressColor
{
    return self.progressLayer.progressColor;
}

- (void)setProgressColor:(UIColor *)progressColor
{
    self.progressLayer.progressColor = progressColor;
    [self.progressLayer setNeedsDisplay];
}



@end
