//
//  KZCircularProgress.m
//  KZCircularProgress
//
//  Created by Kirinzer on 2018/9/6.
//  Copyright © 2018 kirinzer. All rights reserved.
//

#import "KZCircularProgress.h"
#import "KZCircularIndicator.h"

@interface KZCircularProgress ()

@property (nonatomic, strong) KZCircularIndicator *circle;
@property (nonatomic, strong) UILabel *percentLabel;
@property (nonatomic, assign) float progress;

@end

@implementation KZCircularProgress

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    CGFloat bgWidth = 130;
    CGFloat bgHeight = 95;
    CGFloat radius = 40;
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width-bgWidth)/2, (self.frame.size.height-bgHeight)/2, bgWidth, bgHeight)];
    bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    bgView.layer.cornerRadius = 4;
    bgView.layer.masksToBounds = YES;
    [self addSubview:bgView];
    
    self.percentLabel = [[UILabel alloc] initWithFrame:CGRectMake((bgWidth-radius)/2, 13, radius, radius)];
    self.percentLabel.textColor = [UIColor whiteColor];
    self.percentLabel.textAlignment = NSTextAlignmentCenter;
    self.percentLabel.font = [UIFont systemFontOfSize:11];
    self.percentLabel.text = @"0%";
    [bgView addSubview:self.percentLabel];
    
    self.circle = [[KZCircularIndicator alloc] initWithFrame:CGRectMake((bgWidth-radius)/2, 13, radius, radius) lineWidth:4];
    [bgView addSubview:_circle];
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, bgWidth, 15)];
    tipLabel.font = [UIFont systemFontOfSize:14];
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.text = @"正在保存到本地";
    [bgView addSubview:tipLabel];
}

- (void)setProgress:(float)progress
{
    [self.circle setProgress:progress];
    self.percentLabel.text = [NSString stringWithFormat:@"%.0f%%", progress*100];
}

@end
