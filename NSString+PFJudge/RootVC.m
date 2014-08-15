//
//  RootVC.m
//  NSString+PFJudge
//
//  Created by PFei_He on 14-8-15.
//  Copyright (c) 2014年 PFei_He. All rights reserved.
//

#import "RootVC.h"
#import "NSString+PFJudge.h"

@interface RootVC ()

@end

@implementation RootVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *testStr = @"我要测试这个内容http://www.abc.com.cn";
    NSLog(@"%@", testStr);
    testStr = [testStr matchesURL:testStr];
    NSLog(@"%@", testStr);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
