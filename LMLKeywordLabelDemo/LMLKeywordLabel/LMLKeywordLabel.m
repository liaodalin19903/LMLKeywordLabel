//
//  LMLKeywordLabel.h
//  agriculturalApp
//
//  Created by 廖马儿 on 16/5/14.
//  Copyright © 2016年 youpude. All rights reserved.
//


/*
 
 是用方法：
 lmlLabel=[[LMLKeywordLabel alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
 lmlLabel.center=CGPointMake(self.view.center.x, 100);
 lmlLabel.font=[UIFont systemFontOfSize:16];
 lmlLabel.keywordColor=[UIColor blueColor];
 lmlLabel.keywordFont=[UIFont systemFontOfSize:22];
 lmlLabel.text=@"123456789/*123456.";
 
 [self.view addSubview:lmlLabel];
 
 [lmlLabel setKeyword:@"12"];
 
 */


#import "LMLKeywordLabel.h"

@implementation LMLKeywordLabel

@synthesize keyword = _keyword;
@synthesize keywordColor = _keywordColor;
@synthesize keywordFont = _keywordFont;

-(void)renderKeywordWithOnce:(BOOL)once
{
    
    if(!super.text||[super.text isEqualToString:@""])
        return;
    
    NSRange range = [super.text rangeOfString:self.keyword];
    
    if(range.location == NSNotFound){
        
        return;
    }
    else
    {
        NSMutableArray *rangeArray=[NSMutableArray new];
        NSString *tmpString=super.text;
        
        [self searchRange:tmpString withStoreArray:rangeArray andStartIndex:0];
        
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:super.text];
        
        for (NSValue *value in rangeArray) {
            
            NSRange keyRange = [value rangeValue];
            [attributeString addAttribute:NSForegroundColorAttributeName value:self.keywordColor range:keyRange];
            [attributeString addAttribute:NSFontAttributeName value:self.keywordFont range:keyRange];
            // 第一个弄好就跳出
            if (once) {
                
                break;
            }
            
        }
        
        self.attributedText=attributeString;
    }
}

// 设置范围
-(void)searchRange:(NSString *)sourceString withStoreArray:(NSMutableArray *)storeArray andStartIndex:(NSInteger)startIndex
{
     NSRange tmpRange=[sourceString rangeOfString:self.keyword];
    if(tmpRange.location!=NSNotFound)
    {
      NSValue *value = [NSValue valueWithRange:NSMakeRange(tmpRange.location+startIndex, tmpRange.length)];
      [storeArray addObject:value];
        sourceString=[sourceString substringFromIndex:tmpRange.location+tmpRange.length];
        startIndex=tmpRange.location+tmpRange.length+startIndex;
        [self searchRange:sourceString withStoreArray:storeArray andStartIndex:startIndex];
    }
}

#pragma mark - getter and setter

- (NSString *)keyword
{
    return _keyword;
}

-(UIFont *)keywordFont
{
    if(_keywordFont){
        return _keywordFont;
    }
    else{
        return super.font;
    }
}

-(UIColor *)keywordColor
{
    if(_keywordColor){
        
        return _keywordColor;
    }else {
        
        return super.textColor;
    }
    
    
}



-(void)setKeyWordColor:(UIColor *)color
{
    _keywordColor=color;
    
    [self renderKeywordWithOnce:NO];
}

-(void)setText:(NSString *)text
{
    super.text = text;
}

-(void)setKeyword:(NSString *)keyword
{
    _keyword = keyword;
    
    [self renderKeywordWithOnce:NO];
}

- (void)setKeyword:(NSString *)keyword previous:(BOOL)pre {
    
    _keyword = keyword;
    
    [self renderKeywordWithOnce:pre];
}


@end
