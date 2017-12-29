//
//  AddView.h
//  AddStepView
//
//  Created by 赵娇 on 2017/12/27.
//  Copyright © 2017年 shouxindao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, ADDTYPE) {
    
    NO_SUBTRACTTYPE =0,
    
    PLUS_SUBTRACTTYPE,
    
};


@protocol AddViewDelegate <NSObject>
- (void)showEndNum:(NSString*)endNum;
@end

@interface AddView : UIView
@property(assign,nonatomic)NSInteger addNum;
@property(assign,nonatomic)ADDTYPE addtype;
@property(assign,nonatomic)id<AddViewDelegate> delagate;

-(instancetype)initWithFrame:(CGRect)frame WithAddType:(ADDTYPE)type   WithCurrentPrice:(NSString*)currentPrice WithAddCount:(NSString*)addCount;

@end
