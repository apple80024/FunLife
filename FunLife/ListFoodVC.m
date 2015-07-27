//
//  ListVC.m
//  FunLife
//
//  Created by Brian Chen on 2015/3/17.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import "ListFoodVC.h"
#import "FoodManager.h"
#import "Food.h"

@interface ListFoodVC (){
    UISearchController *searchController;
}

@end

@implementation ListFoodVC
@synthesize tbl_view;

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableViewController *tblvc = [[UITableViewController alloc] init];
    tblvc.tableView = tbl_view;
    searchController = [[UISearchController alloc] initWithSearchResultsController:tblvc];
    searchController.searchResultsUpdater = self;
    
    
    // Do any additional setup after loading the view.
    
    
    foodList = [FoodManager sharedInstance].foods;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return foodList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"foodCell" forIndexPath:indexPath];
    
    UIImageView * image = (UIImageView *) [cell.contentView viewWithTag:1];
    
    [image setImage:[UIImage imageNamed:((Food * )foodList[indexPath.row]).img]];
    
    UILabel * title = (UILabel *) [cell.contentView viewWithTag:2];
    title.text = ((Food *) foodList[indexPath.row]).title;
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [FoodManager sharedInstance].selectedFood = foodList[indexPath.row];
    [self performSegueWithIdentifier:@"segue_detailFood" sender:self];
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

- (IBAction)btn_back:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString * searchString = [self->searchController.searchBar text];
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchString];
    searchResults = [foodList filteredArrayUsingPredicate:resultPredicate];
}

@end
