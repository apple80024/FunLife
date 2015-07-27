//
//  MainVC.h
//  FunLife
//
//  Created by Brian Chen on 2015/3/13.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainVC : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    
    NSMutableArray *list_food;
    NSMutableArray *list_food_forLoop;
    NSMutableArray *list_fun;
    NSMutableArray *list_fun_forLoop;
    NSTimer *tableTimer;
//    UIView * gradientView;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tbl_food;
@property (weak, nonatomic) IBOutlet UITableView *tbl_fun;
- (IBAction)btn_food:(id)sender;

- (IBAction)btn_fun:(id)sender;

@end
