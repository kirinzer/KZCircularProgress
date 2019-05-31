//
//  ViewController.m
//  CircularProgressExample
//
//  Created by Kirinzer on 2019/5/31.
//  Copyright © 2019 kirinzer. All rights reserved.
//

#import "ViewController.h"
#import "KZCircularProgress.h"

@interface ViewController ()

@property (nonatomic, strong) KZCircularProgress *progress;
@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, assign) CGFloat loadingPercent;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 100)];
    [btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [btn setTitle:@"startLoading" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    self.progress = [[KZCircularProgress alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.progress];
    self.progress.hidden = YES;
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(loadingData) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
    self.loadingPercent = 0;
}

- (void)click {
    self.loadingPercent = 0;
    self.timer.fireDate = [NSDate distantPast];
    self.progress.hidden = NO;
}

- (void)loadingData {
    self.loadingPercent += 0.02;
    [self.progress setProgress:self.loadingPercent];
    if (self.loadingPercent >= 1.0) { // complete loading
        self.timer.fireDate = [NSDate distantFuture];
        self.progress.hidden = YES; // hide or remove it
        self.loadingPercent = 0;
    }
}

@end
