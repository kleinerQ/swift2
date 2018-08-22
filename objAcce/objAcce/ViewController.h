//
//  ViewController.h
//  objAcce
//
//  Created by Yen on 2018/8/9.
//  Copyright © 2018年 Yen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAccelerometerDelegate>
    {
        __weak IBOutlet UILabel *xlabel;
        
        __weak IBOutlet UILabel *ylabel;
        __weak IBOutlet UILabel *zlabel;
    }

@end

