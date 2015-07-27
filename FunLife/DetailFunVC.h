//
//  DetailFunVC.h
//  FunLife
//
//  Created by Brian Chen on 2015/3/18.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailFunVC : UIViewController
- (IBAction)btn_back:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;

@end
