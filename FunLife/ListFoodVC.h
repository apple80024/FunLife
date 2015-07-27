//
//  ListVC.h
//  FunLife
//
//  Created by Brian Chen on 2015/3/17.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListFoodVC : UIViewController<UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate, UISearchResultsUpdating>
{
    NSArray  * foodList;
    NSArray * searchResults;
}
- (IBAction)btn_back:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView * tbl_view;

@end
