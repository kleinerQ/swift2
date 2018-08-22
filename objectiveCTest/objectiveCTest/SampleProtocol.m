//
//  SampleProtocol.m
//  objectiveCTest
//
//  Created by Yen on 2018/8/9.
//  Copyright © 2018年 Yen. All rights reserved.
//

#import "SampleProtocol.h"
@implementation SampleProtocol
    
-(void)startSampleProcess{
    
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self.delegate
                                   selector:@selector(processCompleted) userInfo:nil repeats:NO];
}
@end
