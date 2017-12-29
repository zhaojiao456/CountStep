//
//  ViewController.m
//  CountStep
//
//  Created by 赵娇 on 2017/12/29.
//  Copyright © 2017年 zj. All rights reserved.
//

#import "ViewController.h"
#import "AddView.h"
@interface ViewController ()<AddViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AddView*av=[[AddView alloc]initWithFrame:CGRectMake(50, 200, 200, 40) WithAddType:NO_SUBTRACTTYPE WithCurrentPrice:@"1500" WithAddCount:@"300"];
    [self.view addSubview:av];
    av.delagate=self;
    
}

-(void)showEndNum:(NSString *)endNum{
    
    NSLog(@"endcount====%@",endNum);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
