//
//  MainVC.m
//  FunLife
//
//  Created by Brian Chen on 2015/3/13.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import "MainVC.h"
#import "SWRevealViewController.h"
#import "Fun.h"
#import "Food.h"
#import "FoodManager.h"
#import "FunManager.h"

@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    
    
    UIButton *menuBtn = [[UIButton alloc]initWithFrame:(CGRectMake(0, 0, 75, 75))];
    [menuBtn setImage:[UIImage imageNamed:@"ic_menu_black_24dp"] forState:UIControlStateNormal];
    [menuBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [menuBtn setTintColor:[UIColor whiteColor]];
    [menuBtn addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menuBtn];

    
    [self.view setBackgroundColor:[UIColor grayColor]];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.tbl_fun.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tbl_food.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    list_food =[[NSMutableArray alloc]init];
    list_food_forLoop =[[NSMutableArray alloc]init];
    
    Food *food1 = [[Food alloc]init];
    food1.img = @"food_01";
    food1.title = @"1st Food";
    [list_food addObject:food1];
    
    Food *food2 = [[Food alloc]init];
    food2.img = @"food_02";
    food2.title = @"2nd Food";
    [list_food addObject:food2];
    
    Food *food3 = [[Food alloc]init];
    food3.img = @"food_03";
    food3.title = @"3rd Food";
    [list_food addObject:food3];
    
    Food *food4 = [[Food alloc]init];
    food4.img = @"food_04";
    food4.title = @"4th Food";
    [list_food addObject:food4];
    
    Food *food5 = [[Food alloc]init];
    food5.img = @"food_05";
    food5.title = @"5th Food";
    [list_food addObject:food5];
    
    Food *food6 = [[Food alloc]init];
    food6.img = @"food_06";
    food6.title = @"6th Food";
    [list_food addObject:food6];
    
    list_fun = [[NSMutableArray alloc]init];
    list_fun_forLoop = [[NSMutableArray alloc]init];
    
    Fun *fun1 = [[Fun alloc]init];
    fun1.img = @"fun_01";
    fun1.title = @"1st Fun";
    [list_fun addObject:fun1];
    
    Fun *fun2 = [[Fun alloc]init];
    fun2.img = @"fun_02";
    fun2.title = @"2nd Fun";
    [list_fun addObject:fun2];
    
    Fun *fun3 = [[Fun alloc]init];
    fun3.img = @"fun_03";
    fun3.title = @"3rd Fun";
    [list_fun addObject:fun3];
    
    Fun *fun4 = [[Fun alloc]init];
    fun4.img = @"fun_04";
    fun4.title = @"4th Fun";
    [list_fun addObject:fun4];
    
    Fun *fun5 = [[Fun alloc]init];
    fun5.img = @"fun_05";
    fun5.title = @"5th Fun";
    [list_fun addObject:fun5];
    
    Fun *fun6 = [[Fun alloc]init];
    fun6.img = @"fun_06";
    fun6.title = @"6th Fun";
    [list_fun addObject:fun6];
    
    Fun *fun7 = [[Fun alloc]init];
    fun7.img = @"fun_07";
    fun7.title = @"7th Fun";
    [list_fun addObject:fun7];
    
    [list_food_forLoop addObjectsFromArray:list_food];
    [list_food_forLoop addObjectsFromArray:list_food];
    [list_fun_forLoop addObjectsFromArray:list_fun];
    [list_fun_forLoop addObjectsFromArray:list_fun];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self autoScroll];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self stopscroll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)scrollViewDidScroll:(UITableView *)tableView
{
    CGFloat actualPosition_food = _tbl_food.contentOffset.y;
    CGFloat actualPosition_fun = _tbl_fun.contentOffset.y;
    
    CGFloat contentHeight_food = _tbl_food.contentSize.height;
    CGFloat contentHeight_fun = _tbl_fun.contentSize.height;
    
    CGFloat tblCenter_food = _tbl_food.frame.size.height/2;
    
    //    NSLog(@"actualPosition_food %f", actualPosition_food);
    //    NSLog(@"tblCenter_food %f", contentHeight_food);
    //    NSLog(@"contentHeight_food %f", tblCenter_food);
    
    
    if (tableView == self.tbl_food) {
        if (actualPosition_food < 0) {
            [_tbl_food setContentOffset:CGPointMake(_tbl_food.contentOffset.x, _tbl_food.contentOffset.y + _tbl_food.contentSize.height/2 - 1) animated:NO];
        }
        if (actualPosition_food > contentHeight_food/2) {
            [_tbl_food setContentOffset:CGPointMake(_tbl_food.contentOffset.x, 1 ) animated:NO];
        }
    }
    if (tableView == self.tbl_fun) {
        if (actualPosition_fun < 0) {
            [_tbl_fun setContentOffset:CGPointMake(_tbl_fun.contentOffset.x, _tbl_fun.contentOffset.y + _tbl_fun.contentSize.height/2 - 1) animated:NO];
        }
        if (actualPosition_fun > contentHeight_fun/2) {
            [_tbl_fun setContentOffset:CGPointMake(_tbl_fun.contentOffset.x, 1 ) animated:NO];
        }
        
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.tbl_food) {
        
        return list_food_forLoop.count;
        
    }
    else{
        
        return list_fun_forLoop.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView != self.tbl_fun) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"foodCell" forIndexPath:indexPath];
        Food * list = [list_food_forLoop objectAtIndex:indexPath.row];
        
        UIImageView * image = (UIImageView *) [cell.contentView viewWithTag:1];
        [image setImage:[UIImage imageNamed:list.img]];
        
        UILabel *title = (UILabel *) [cell.contentView viewWithTag:2];
        title.text = list.title;
        
        UIImageView * gradientView = (UIImageView *) [cell.contentView viewWithTag:3];
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = gradientView.bounds;
        gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor], (id)[[UIColor blackColor] CGColor], nil];
        
        [gradientView.layer setSublayers:[[NSArray alloc] initWithObjects:gradient, nil]];
        gradientView.alpha = 1.0f;
        
        return cell;
    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"funCell" forIndexPath:indexPath];
        
        Fun * list = [list_fun_forLoop objectAtIndex:indexPath.row];
        UIImageView * image = (UIImageView *) [cell.contentView viewWithTag:1];
        [image setImage:[UIImage imageNamed:list.img]];
        
        UILabel *title = (UILabel *) [cell.contentView viewWithTag:2];
        title.text = list.title;
        
        UIImageView * gradientView = (UIImageView *) [cell.contentView viewWithTag:3];
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = gradientView.bounds;
        gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor], (id)[[UIColor blackColor] CGColor], nil];
        
        [gradientView.layer setSublayers:[[NSArray alloc] initWithObjects:gradient, nil]];
        gradientView.alpha = 1.0f;
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _tbl_food) {
        [FoodManager sharedInstance].selectedFood = list_food_forLoop[indexPath.row];
        [self performSegueWithIdentifier:@"segue_detailFood" sender:nil];
    }
    if (tableView == _tbl_fun) {
        [FunManager sharedInstance].selectedFun = list_fun_forLoop[indexPath.row];
        [self performSegueWithIdentifier:@"segue_detailFun" sender:nil];
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

#pragma mark - BUTTON ACTION
- (IBAction)btn_food:(id)sender {
    [FoodManager sharedInstance].foods = list_food;
    [self performSegueWithIdentifier:@"segue_foodList" sender: nil];
}

- (IBAction)btn_fun:(id)sender {
    [FunManager sharedInstance].funs = list_fun;
    [self performSegueWithIdentifier:@"segue_funList" sender: nil];
}

#pragma mark - OTHER METHOD
-(void)autoScroll{
    tableTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 //this value arranges the speed of the autoScroll
                                                  target:self
                                                selector:@selector(automaticScroll)
                                                userInfo:nil
                                                 repeats:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:9999 //this arranges the duration of the scroll
                                     target:self
                                   selector:@selector(stopscroll)
                                   userInfo:nil
                                    repeats:NO];
}

-(void)automaticScroll
{
    [_tbl_food setContentOffset:CGPointMake(_tbl_food.contentOffset.x, _tbl_food.contentOffset.y + 5) animated:YES]; //the 50 stands for the amount of movement every tick the timer will make
    [_tbl_fun setContentOffset:CGPointMake(_tbl_fun.contentOffset.x, _tbl_fun.contentOffset.y + 5) animated:YES]; //the 50 stands for the amount of movement every tick the timer will make
}

-(void)stopscroll
{
    //stop tabletimer again
    [tableTimer invalidate];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}
@end
