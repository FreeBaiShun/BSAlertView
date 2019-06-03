//
//  BSAlertView.h
//  BSAlertViewDemo
//
//  Created by BS on 2019/4/23.
//  Copyright © 2019 BS. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^AuctionBlk)(void);
NS_ASSUME_NONNULL_BEGIN

@interface BSAlertView : UIView

/** 弹窗标题标签 */
@property (strong, nonatomic) UILabel *labTitle;
/** 弹窗子标题标签 */
@property (strong, nonatomic) UILabel *labSubTitle;
/** 弹窗左面按钮标签 */
@property (strong, nonatomic) UILabel *labBtnLeft;
/** 弹窗右面按钮标签 */
@property (strong, nonatomic) UILabel *labBtnRight;
/** 弹窗中间视图 */
@property (strong, nonatomic) UIView *viewMiddle;
/** 弹窗底部阴影视图 */
@property (strong, nonatomic) UIView *viewShadow;
/** 是否显示一个标题 （无subTitle）*/
@property (assign, nonatomic) NSUInteger isOneTitle;

//事件
/** 阴影视图点击回调 */
@property (strong, nonatomic) __block AuctionBlk shadowViewClickBlk;
/** 左面按钮点击回调 */
@property (strong, nonatomic) __block AuctionBlk btnLeftClickBlk;
/** 右面按钮点击回调 */
@property (strong, nonatomic) __block AuctionBlk btnRightClickBlk;
@end

NS_ASSUME_NONNULL_END
