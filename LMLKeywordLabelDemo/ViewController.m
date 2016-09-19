//
//  ViewController.m
//  LMLKeywordLabelDemo
//
//  Created by 优谱德 on 16/9/19.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import "ViewController.h"
#import "LMLKeywordLabel/LMLKeywordLabel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet LMLKeywordLabel *content_label;
@property (weak, nonatomic) IBOutlet LMLKeywordLabel *content_label2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initData];

}

- (void)initData {

    self.content_label.keywordColor = [UIColor redColor];
    
    self.content_label.text = @"邓海滨@廖马儿曾经沧海难为水，除却巫山不是云，如果你觉得适合你，请点一个赞@廖马儿.";
    self.content_label.numberOfLines = 0;
    
    
    [self.content_label setKeyword:@"@廖马儿" previous:YES];
    
    
    self.content_label2.text = @"邓海滨@廖马儿曾经沧海难为水，除却巫山不是云，如果你觉得适合你，请点一个赞@廖马儿.";
    self.content_label2.numberOfLines = 0;
    self.content_label2.font = [UIFont fontWithName:@"HanziPenSC-W3" size:13];
    self.content_label2.keywordColor = [UIColor orangeColor];
    [self.content_label2 setKeyword:@"@廖马儿" previous:NO];
    
    
}



@end
