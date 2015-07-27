//
//  SideMenuVC.h
//  FunLife
//
//  Created by Brian Chen on 2015/3/13.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideMenuVC : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray * menuList;
}

@property(nonatomic, weak) IBOutlet UITableView * tbl_view;

@end
