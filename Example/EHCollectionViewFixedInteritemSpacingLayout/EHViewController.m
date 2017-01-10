//
//  EHViewController.m
//  EHCollectionViewFixedInteritemSpacingLayout
//
//  Created by Eric Huang on 01/08/2017.
//  Copyright (c) 2017 Eric Huang. All rights reserved.
//

#import "EHViewController.h"
#import <Masonry/Masonry.h>
#import <EHCollectionViewFixedInteritemSpacingLayout/EHCollectionViewFixedInteritemSpacingLayout.h>
#import "EHDemoCollectionViewCell.h"

static CGFloat const kLabelHeight = 30.0f;
static CGFloat const kFixedInteritemSpacing = 20.0f;
static CGFloat const kMinimumLineSpacing = 12.0f;
static NSString * const kEHDemoCollectionViewCellIdentifier = @"EHDemoCollectionViewCell";

@interface EHViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *words;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation EHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self configureForNavigationBar];
    [self configureForViews];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (BOOL)hidesBottomBarWhenPushed {
    return YES;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.words.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EHDemoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kEHDemoCollectionViewCellIdentifier forIndexPath:indexPath];
    
    [cell configureWithText:self.words[indexPath.item]];
    return cell;
}

#pragma mark - UICollectionViewDelegate

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *word = self.words[indexPath.item];
    CGSize size = [word sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13.0f]}];
    
    return CGSizeMake(size.width * 2, kLabelHeight);
}

#pragma mark - private methods

- (void)configureForNavigationBar {
    self.navigationItem.title = @"Home";
}

- (void)configureForViews {
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - getters & setters

- (NSArray *)words {
    if (!_words) {
        _words = @[
                   @"照片", @"拍摄", @"小视频", @"视频聊天",
                   @"红包", @"转账", @"位置", @"收藏",
                   @"个人名片", @"语音输入", @"卡券"
                   ];
    }
    
    return _words;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        EHCollectionViewFixedInteritemSpacingLayout *layout = [[EHCollectionViewFixedInteritemSpacingLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = kMinimumLineSpacing;
        layout.minimumInteritemSpacing = kFixedInteritemSpacing;
        layout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1.0f];
        
        [_collectionView registerClass:[EHDemoCollectionViewCell class] forCellWithReuseIdentifier:kEHDemoCollectionViewCellIdentifier];
    }
    
    return _collectionView;
}

@end
