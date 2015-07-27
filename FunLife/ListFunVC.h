//
//  ListFunVC.h
//  FunLife
//
//  Created by Brian Chen on 2015/3/18.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListFunVC : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating>
{
    NSArray * funList;
}

- (IBAction)btn_back:(id)sender;
@end
