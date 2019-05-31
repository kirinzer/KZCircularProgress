//
//  KZCircularIndicator.m
//  KZCircularProgress
//
//  Created by Kirinzer on 2018/9/6.
//  Copyright © 2018 kirinzer. All rights reserved.
//

#import "KZCircularIndicator.h"

@interface KZCircularIndicator ()

@property (nonatomic, strong) CAShapeLayer *trackLayer;
@property (nonatomic, strong) CAShapeLayer *progressLayer;

@end

@implementation KZCircularIndicator

- (instancetype)initWithFrame:(CGRect)frame lineWidth:(float)lineWidth {
    self = [super initWithFrame:frame];
    if (self) {
        [self drawUI:lineWidth];
    }
    return self;
}

- (void)drawUI:(CGFloat)lineWidth {
    float centerX = self.bounds.size.width/2.0;
    float centerY = self.bounds.size.height/2.0;
    float radius = (self.bounds.size.width-lineWidth)/2.0;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(centerX, centerY) radius:radius startAngle:(-0.5f*M_PI) endAngle:1.5f*M_PI clockwise:YES];
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.frame = self.bounds;
    self.progressLayer.fillColor = [[UIColor clearColor] CGColor];
    self.progressLayer.strokeColor = UIColor.whiteColor.CGColor;
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.lineWidth = lineWidth;
    self.progressLayer.path = [path CGPath];
    self.progressLayer.strokeEnd = 0;
    [self.layer addSublayer:self.progressLayer];
}

- (void)setProgress:(float)progress
{
    self.progressLayer.strokeEnd = progress;
}

@end
