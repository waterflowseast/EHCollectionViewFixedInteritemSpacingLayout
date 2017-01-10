//
//  EHDemoCollectionViewCell.m
//  EHCollectionViewFixedInteritemSpacingLayout
//
//  Created by Eric Huang on 17/1/10.
//  Copyright © 2017年 Eric Huang. All rights reserved.
//

#import "EHDemoCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface EHDemoCollectionViewCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation EHDemoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    
    return self;
}

- (void)configureWithText:(NSString *)text {
    self.label.text = text;
}

#pragma mark - getters & setters

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textColor = [UIColor blackColor];
        _label.backgroundColor = [UIColor whiteColor];
        
        _label.clipsToBounds = YES;
        _label.layer.borderWidth = 1.0f;
        _label.layer.borderColor = [UIColor redColor].CGColor;
        _label.layer.cornerRadius = 15.0f;
        _label.font = [UIFont systemFontOfSize:13.0f];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    
    return _label;
}

@end
