//
//  ViewController.m
//  objAcce
//
//  Created by Yen on 2018/8/9.
//  Copyright © 2018年 Yen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIAccelerometer sharedAccelerometer]setDelegate:self];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:
(UIAcceleration *)acceleration{
    [xlabel setText:[NSString stringWithFormat:@"%f",acceleration.x]];
    [ylabel setText:[NSString stringWithFormat:@"%f",acceleration.y]];
    [zlabel setText:[NSString stringWithFormat:@"%f",acceleration.z]];
}

@end
