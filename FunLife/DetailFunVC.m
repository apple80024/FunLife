//
//  DetailFunVC.m
//  FunLife
//
//  Created by Brian Chen on 2015/3/18.
//  Copyright (c) 2015年 Brian Chen. All rights reserved.
//

#import "DetailFunVC.h"
#import "FunManager.h"

@interface DetailFunVC ()

@end

@implementation DetailFunVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.image setImage:[UIImage imageNamed:[FunManager sharedInstance].selectedFun.img]];
    self.lbl_title.text = [FunManager sharedInstance].selectedFun.title;
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
