//
//  LMLKeywordLabel.h
//  agriculturalApp
//
//  Created by 廖马儿 on 16/5/14.
//  Copyright © 2016年 youpude. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMLKeywordLabel : UILabel

// 关键词
@property(nonatomic,copy) NSString *keyword;

// 关键词字体
@property(nonatomic,strong) UIFont *keywordFont;

// 关键词颜色
@property(nonatomic,strong) UIColor *keywordColor;

// 设置关键字，pre == YES 的话，值设置最前面的 比如微博中@廖马儿 就只让最前面的@廖马儿 为选中颜色
- (void)setKeyword:(NSString *)keyword previous:(BOOL)pre;

@end
