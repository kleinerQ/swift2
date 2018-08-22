//
//  SampleProtocol.h
//  objectiveCTest
//
//  Created by Yen on 2018/8/9.
//  Copyright © 2018年 Yen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SampleProtocol <NSObject>
@required
- (void) processCompleted;
@end
// 协议定义结束
@interface SampleProtocol : NSObject
    
    {
        // Delegate to respond back
        id <SampleProtocol> _delegate;
        
    }
@property (nonatomic,strong) id delegate;
    
-(void)startSampleProcess; // Instance method
@end
