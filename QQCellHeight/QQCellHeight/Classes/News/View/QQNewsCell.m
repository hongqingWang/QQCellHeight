//
//  QQNewsCell.m
//  MVVM
//
//  Created by Mac on 30/11/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

#import "QQNewsCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "QQNewsViewModel.h"
#import "QQNews.h"

@interface QQNewsCell ()

/// 标题
@property (nonatomic, strong) UILabel *newsTitleLabel;
/// 图片
@property (nonatomic, strong) UIImageView *newsImageView;
/// 副标题
@property (nonatomic, strong) UILabel *newsSubTitleLabel;
/// 跟帖数
@property (nonatomic, strong) UILabel *replyCountLabel;

@end

@implementation QQNewsCell

- (void)setViewModel:(QQNewsViewModel *)viewModel {
    _viewModel = viewModel;
    
    [self.newsImageView sd_setImageWithURL:viewModel.imgsrc_url placeholderImage:[UIImage imageNamed:@"qq_news_placeholder"]];
    self.newsTitleLabel.text = viewModel.news.title;
    self.newsSubTitleLabel.text = viewModel.news.digest;
    self.replyCountLabel.text = viewModel.replyCount_string;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self setupUI];
    }
    return self;
}

+ (instancetype)newsCellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"QQNewsCell";
    QQNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[QQNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - SetupUI
- (void)setupUI {
    
    [self addSubview:self.newsImageView];
    [self addSubview:self.newsTitleLabel];
    [self addSubview:self.newsSubTitleLabel];
    [self addSubview:self.replyCountLabel];
    
    [self.newsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
    }];
    [self.newsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.newsTitleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.newsTitleLabel);
        make.right.equalTo(self.newsTitleLabel);
        make.height.mas_equalTo(300);
    }];
    [self.newsSubTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.newsImageView.mas_bottom).offset(10);
        make.left.equalTo(self.newsImageView);
        make.right.equalTo(self.newsImageView);
    }];
    [self.replyCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-10);
        make.right.equalTo(self).offset(-10);
    }];
}

#pragma mark - Getters and Setters
- (UILabel *)newsTitleLabel {
    if (_newsTitleLabel == nil) {
        _newsTitleLabel = [[UILabel alloc] init];
        _newsTitleLabel.text = @"标题";
        _newsTitleLabel.textColor = [UIColor darkGrayColor];
        _newsTitleLabel.font = [UIFont systemFontOfSize:16];
        _newsTitleLabel.numberOfLines = 0;
    }
    return _newsTitleLabel;
}

- (UIImageView *)newsImageView {
    if (_newsImageView == nil) {
        _newsImageView = [[UIImageView alloc] init];
        _newsImageView.image = [UIImage imageNamed:@"qq_news_placeholder"];
    }
    return _newsImageView;
}

- (UILabel *)newsSubTitleLabel {
    if (_newsSubTitleLabel == nil) {
        _newsSubTitleLabel = [[UILabel alloc] init];
        _newsSubTitleLabel.text = @"副标题";
        _newsSubTitleLabel.textColor = [UIColor lightGrayColor];
        _newsSubTitleLabel.font = [UIFont systemFontOfSize:14];
        _newsSubTitleLabel.numberOfLines = 0;
    }
    return _newsSubTitleLabel;
}

- (UILabel *)replyCountLabel {
    if (_replyCountLabel == nil) {
        _replyCountLabel = [[UILabel alloc] init];
        _replyCountLabel.text = @"跟帖数";
        _replyCountLabel.textColor = [UIColor darkGrayColor];
        _replyCountLabel.font = [UIFont systemFontOfSize:12];
        _replyCountLabel.textAlignment = NSTextAlignmentRight;
    }
    return _replyCountLabel;
}

@end
