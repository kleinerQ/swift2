//
//  ViewController.h
//  objectiveCTest
//
//  Created by Yen on 2018/8/9.
//  Copyright © 2018年 Yen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SampleProtocol.h"


@interface ViewController : UIViewController<SampleProtocol>
    {
        
        __weak IBOutlet UILabel *myLabel;
    }
    
    
@end

