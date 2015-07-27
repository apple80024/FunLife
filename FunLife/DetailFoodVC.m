//
//  DetailVC.m
//  FunLife
//
//  Created by Brian Chen on 2015/3/17.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import "DetailFoodVC.h"
#import "FoodManager.h"

@interface DetailFoodVC ()

@end

@implementation DetailFoodVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",[FoodManager sharedInstance].selectedFood.img);
    
    [self.image setImage:[UIImage imageNamed:[FoodManager sharedInstance].selectedFood.img]];
    
    self.lbl_title.text = [FoodManager sharedInstance].selectedFood.title;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btn_back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
