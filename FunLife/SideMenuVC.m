//
//  SideMenuVC.m
//  FunLife
//
//  Created by Brian Chen on 2015/3/13.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import "SideMenuVC.h"
#import "SWRevealViewController.h"

@interface SideMenuVC ()

@end

@implementation SideMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    menuList = [[NSMutableArray alloc]initWithObjects:HOME, API_TEST, nil];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [[_tbl_view cellForRowAtIndexPath:_tbl_view.indexPathForSelectedRow] setSelected:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return menuList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    UILabel * lbl_name = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 250, 50)];
    lbl_name.text = [menuList objectAtIndex:indexPath.row];
    
    [cell addSubview:lbl_name];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *identifier = [menuList objectAtIndex:indexPath.row];
    
    if ([identifier isEqualToString:HOME]) {
        UINavigationController * navigationController = [[UINavigationController alloc]initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"mainVC"]];
        [[navigationController navigationBar] setHidden:YES];
        [self.revealViewController pushFrontViewController:navigationController animated:YES];
    }
    if ([identifier isEqualToString:API_TEST]) {
        UINavigationController * navigationController = [[UINavigationController alloc]initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"API_TestVC"]];
        [[navigationController navigationBar] setHidden:YES];
        [self.revealViewController pushFrontViewController:navigationController animated:YES];
    }
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
