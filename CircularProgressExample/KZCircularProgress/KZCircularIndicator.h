//
//  KZCircularIndicator.h
//  KZCircularProgress
//
//  Created by Kirinzer on 2018/9/6.
//  Copyright © 2018 kirinzer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KZCircularIndicator : UIView

/// cycle line width
- (instancetype)initWithFrame:(CGRect)frame lineWidth:(float)lineWidth;

/// progress value from 0 to 1
- (void)setProgress:(float)progress;

@end

NS_ASSUME_NONNULL_END
