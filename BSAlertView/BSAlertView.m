//
//  BSAlertView.m
//  BSAlertViewDemo
//
//  Created by BS on 2019/4/23.
//  Copyright © 2019 BS. All rights reserved.
//

#import "BSAlertView.h"
#define BSAlertViewScreenSize [UIScreen mainScreen].bounds.size
#define BSAlertViewiPhoneX ((BSAlertViewScreenSize.width == 375.f || BSAlertViewScreenSize.width == 414.f)  && (BSAlertViewScreenSize.height == 812.f || BSAlertViewScreenSize.height == 896.f) ? YES : NO)
#define BSAlertViewNAVHEIGHT (BSAlertViewiPhoneX ? 88 : 64)
#define BSAlertViewNAVTOP (BSAlertViewiPhoneX ? 44 : 20)
#define BSAlertViewBARHEIGH (BSAlertViewiPhoneX ? 83 : 49)
#define BSAlertViewiPhoneXBottomSafeFieldHeight (BSAlertViewiPhoneX ? 34 : 0)

@interface BSAlertView ()

@end

@implementation BSAlertView{
    UIView *viewLeft, *viewRight;
    UIView *viewLineH;
    UIView *viewLineV;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    //阴影视图
    _viewShadow = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BSAlertViewScreenSize.width, BSAlertViewScreenSize.height)];
    _viewShadow.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self addSubview:_viewShadow];
    
    //中间视图
    _viewMiddle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 234.0, 144.0)];
    _viewMiddle.center = _viewShadow.center;
    _viewMiddle.backgroundColor = [UIColor whiteColor];
    _viewMiddle.layer.cornerRadius = 4.0;
    _viewMiddle.layer.masksToBounds = YES;
    [_viewShadow addSubview:_viewMiddle];
    
    viewLineH = [[UIView alloc] initWithFrame:CGRectMake(0, 144.0 - 50.0, _viewMiddle.bounds.size.width, 1.0)];
    viewLineH.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0];
    [_viewMiddle addSubview:viewLineH];
    
    viewLineV = [[UIView alloc] initWithFrame:CGRectMake(_viewMiddle.bounds.size.width/2.0, 144.0 - 50.0, 1, 45.0)];
    viewLineV.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0];
    [_viewMiddle addSubview:viewLineV];
    
    _labTitle = [[UILabel alloc] initWithFrame:CGRectMake(14.0, 26.0, _viewMiddle.bounds.size.width- 14.0*2, 16.0)];
    _labTitle.font = [UIFont systemFontOfSize:14.0];
    _labTitle.textColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1.0];
    _labTitle.textAlignment = NSTextAlignmentCenter;
    _labTitle.font = [UIFont fontWithName:@"PingFangSC-Medium" size:15.0];
    [_viewMiddle addSubview:_labTitle];
    
    _labSubTitle = [[UILabel alloc] initWithFrame:CGRectMake(14.0, _labTitle.bounds.size.height + _labTitle.frame.origin.y + 8, _viewMiddle.bounds.size.width- 14.0*2, 16.0)];
    _labSubTitle.textColor = [UIColor colorWithRed:149/255.0 green:160/255.0 blue:152/255.0 alpha:1.0];
    _labSubTitle.textAlignment = NSTextAlignmentCenter;
    _labSubTitle.font = [UIFont systemFontOfSize:14.0];
    [_viewMiddle addSubview:_labSubTitle];
    
    viewLeft = [[UIView alloc] initWithFrame:CGRectMake(0, viewLineH.frame.origin.y + viewLineH.bounds.size.height, viewLineV.frame.origin.x, viewLineV.bounds.size.height)];
    [_viewMiddle addSubview:viewLeft];
    _labBtnLeft = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, viewLeft.bounds.size.width, viewLeft.bounds.size.height)];
    _labBtnLeft.textColor = [UIColor colorWithRed:135/255.0 green:139/255.0 blue:149/255.0 alpha:1.0];
    _labBtnLeft.textColor = [UIColor colorWithRed:149/255.0 green:160/255.0 blue:152/255.0 alpha:1.0];
    _labBtnLeft.center = viewLeft.center;
    _labBtnLeft.textAlignment = NSTextAlignmentCenter;
    _labBtnLeft.text = @"取消";
    [viewLeft addSubview:_labBtnLeft];
    
    viewRight = [[UIView alloc] initWithFrame:CGRectMake(viewLineV.frame.origin.x + viewLineV.bounds.size.width, viewLineV.frame.origin.y, _viewMiddle.bounds.size.width - viewLineV.frame.origin.x - viewLineV.bounds.size.width, viewLineV.bounds.size.height)];
    [_viewMiddle addSubview:viewRight];
    _labBtnRight = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, viewRight.bounds.size.width, viewRight.bounds.size.height)];
    _labBtnRight.center = viewRight.center;
    
    _labBtnRight.textColor = [UIColor colorWithRed:56/255.0 green:81/255.0 blue:63/255.0 alpha:1.0];
    _labBtnRight.textAlignment = NSTextAlignmentCenter;
    _labBtnRight.text = @"确认";
    [viewRight addSubview:_labBtnRight];
}



- (void)setIsOneTitle:(NSUInteger)isOneTitle{
    _isOneTitle = isOneTitle;
    if (isOneTitle) {
        CGRect react = _labTitle.frame;
        react.origin.y = 30.0;
        _labTitle.frame = react;
        
        CGRect frame = _viewMiddle.frame;
        frame.size.height = 132.0;
        _viewMiddle.frame = frame;
        _labSubTitle.text = @"";
    }
}

- (void)willMoveToWindow:(UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
    
    if (self.btnLeftClickBlk) {
        [viewLeft addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnLeftClick)]];
    }
    
    if (self.btnRightClickBlk) {
        [viewRight addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnRightClick)]];
    }
    
    if (self.shadowViewClickBlk) {
        [_viewShadow addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shadowViewClick)]];
    }
}

#pragma mark - Auction
#pragma mark 阴影视图被点击
- (void)shadowViewClick{
    self.shadowViewClickBlk();
}

#pragma mark 左面按钮被点击
- (void)btnLeftClick{
    self.btnLeftClickBlk();
}

#pragma mark 右面按钮被点击
- (void)btnRightClick{
    self.btnRightClickBlk();
}

- (void)layoutSubviews{
    viewLineH.frame = CGRectMake(0, _viewMiddle.bounds.size.height - 50.0, _viewMiddle.bounds.size.width, 1.0);
    viewLineV.frame = CGRectMake(_viewMiddle.bounds.size.width/2.0, _viewMiddle.bounds.size.height - 50.0+1, 1, 45.0);
    viewLeft.frame = CGRectMake(0, viewLineH.frame.origin.y + viewLineH.bounds.size.height, viewLineV.frame.origin.x, viewLineV.bounds.size.height);
    _labBtnLeft.frame = CGRectMake(0, 0, viewLeft.bounds.size.width, viewLeft.bounds.size.height);
    viewRight.frame = CGRectMake(viewLineV.frame.origin.x + viewLineV.bounds.size.width, viewLineV.frame.origin.y, _viewMiddle.bounds.size.width - viewLineV.frame.origin.x - viewLineV.bounds.size.width, viewLineV.bounds.size.height);
    _labBtnRight.frame = CGRectMake(0, 0, viewRight.bounds.size.width, viewRight.bounds.size.height);
}
@end


