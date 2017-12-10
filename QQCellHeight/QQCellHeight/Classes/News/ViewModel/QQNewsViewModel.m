//
//  QQNewsViewModel.m
//  MVVM
//
//  Created by Mac on 30/11/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsViewModel.h"
#import "QQNews.h"

static CGFloat const margin = 10;

@implementation QQNewsViewModel

+ (instancetype)viewModelWithNews:(QQNews *)news {
    
    QQNewsViewModel *viewModel = [[self alloc] init];
    
    viewModel.news = news;
    
    return viewModel;
}

- (NSURL *)imgsrc_url {
    
    return [NSURL URLWithString:self.news.imgsrc];
}

- (NSString *)replyCount_string {
    
    // 测试跟帖数超过1万
//    self.news.replyCount = 23456;
    
    if (self.news.replyCount >= 10000) {
        
        NSString *string = [NSString stringWithFormat:@"%ld万 跟帖", self.news.replyCount / 10000];
        return string;
    }
    return [NSString stringWithFormat:@"%ld 跟帖", self.news.replyCount];
}

- (CGFloat)cellHeight {
    
    if (_cellHeight) {
        return _cellHeight;
    }
    CGSize textMaxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - (2 * margin), MAXFLOAT);
    NSLog(@"%f", _cellHeight);
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    _cellHeight += 10;
    _cellHeight += [self.news.title boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.height;
    _cellHeight += 10;
    _cellHeight += [self.news.digest boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
    _cellHeight += 10;
    // 跟帖高度
    _cellHeight += 15;
    _cellHeight += 10;
    NSLog(@"%s-%f", __FUNCTION__, _cellHeight);
//    _cellHeight += 100;
    return _cellHeight;
}

@end
