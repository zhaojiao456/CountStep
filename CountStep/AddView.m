//
//  AddView.m
//  AddStepView
//
//  Created by 赵娇 on 2017/12/27.
//  Copyright © 2017年 shouxindao. All rights reserved.
//

#import "AddView.h"

@interface AddView()

@property(strong,nonatomic)UIButton*leftButton;
@property(strong,nonatomic)UILabel*currentLab;
@property(strong,nonatomic)UIButton*rightButton;

@end


@implementation AddView
-(instancetype)initWithFrame:(CGRect)frame WithAddType:(ADDTYPE)type   WithCurrentPrice:(NSString*)currentPrice WithAddCount:(NSString*)addCount{
    
    if (self=[super initWithFrame:frame]) {
        
        self.layer.borderWidth=1;
        self.layer.borderColor=[UIColor lightGrayColor].CGColor;
       // [self.layer setCornerRadius:10];
        //[self setClipsToBounds:YES];
        CGFloat h=self.frame.size.height;
        _addNum=[addCount integerValue];
        _addtype=type;
        
        _leftButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_leftButton];
        _leftButton.frame=CGRectMake(0, 0, h, h);
        [_leftButton setTitle:@"-" forState:UIControlStateNormal];
        [_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _leftButton.tag=998;
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef borderColorRef = CGColorCreate(colorSpace,(CGFloat[]){ 0.83, 0.83, 0.83, 1 });
        
        _leftButton.layer.borderColor = borderColorRef;
        //[_leftButton.layer setMasksToBounds:YES];
        //[_leftButton.layer setCornerRadius:3.0]; //设置矩圆角半径
        [_leftButton.layer setBorderWidth:1.0];   //边框宽度
        
        
        
        _currentLab=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftButton.frame), 0, self.frame.size.width-2*h, h)];
        [self addSubview:_currentLab];
        _currentLab.textColor=[UIColor blackColor];
        _currentLab.textAlignment=NSTextAlignmentCenter;
        _currentLab.font=[UIFont systemFontOfSize:15];
        _currentLab.text=currentPrice;
        _rightButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:_rightButton];
        _rightButton.frame=CGRectMake(CGRectGetMaxX(_currentLab.frame), 0, h, h);
        [_rightButton setTitle:@"+" forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _rightButton.tag=999;
        _rightButton.layer.borderColor = borderColorRef;
         [_rightButton.layer setBorderWidth:1.0];
        
    }
    
    return self;
}
-(void)buttonAction:(UIButton*)butn{
    UIButton*button=[self viewWithTag:butn.tag];
        if (button.tag==999) {
        
            if (_addNum<=0) {
                 button.enabled=NO;
               [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                return ;
            }
            
            NSInteger num=[self.currentLab.text integerValue];
            num=num +_addNum;
            
            self.currentLab.text=[NSString stringWithFormat:@"%ld",num];
            NSLog(@"num===%@",self.currentLab.text);
           
            [self.delagate showEndNum:self.currentLab.text];
        }else if (button.tag==998){
            
            if (_addtype==NO_SUBTRACTTYPE) {
                
                [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
                button.enabled=NO;
                return ;
            }
            
            NSInteger num=[self.currentLab.text integerValue];
            if (num<_addNum) {
                return;
            }
            num=num -_addNum;
            
            self.currentLab.text=[NSString stringWithFormat:@"%ld",num];
             NSLog(@"num===%@",self.currentLab.text);
             [self.delagate showEndNum:self.currentLab.text];
        }
    
}
-(void)setAddNum:(NSInteger)addNum{
    _addNum=addNum;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
