//
//  LabelCollectionView.m
//  FoodTaste
//
//  Created by shown on 16/3/29.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import "LabelCollectionView.h"

static NSString *identify = @"LabelCell";
static NSString *headIdentify = @"LabelCell";

@implementation LabelCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout])
    {
        self.backgroundColor = RGBCOLOR(222, 222, 222);
        self.dataSource = self;
        self.delegate = self;
        
        
        [self registerClass:[LabelCollectionViewCell class] forCellWithReuseIdentifier:identify];
        [self registerClass:[LabelCollectionViewSectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headIdentify];
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _dataArr.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    HomeModel *model = _dataArr[section];
    return model.subArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    LabelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    HomeModel *model = _dataArr[indexPath.section];
    SubFootModel *subModel = model.subArr[indexPath.row];
    cell.nameLab.text = subModel.nameStr;
    return cell;
}

// 分组
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    LabelCollectionViewSectionView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headIdentify forIndexPath:indexPath];
    HomeModel *model = _dataArr[indexPath.section];
    view.titleLab.text = model.parentName;
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.width, CTMake(45));
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_collectionBlock) {
        HomeModel *model = _dataArr[indexPath.section];
        SubFootModel *subModel = model.subArr[indexPath.row];
        _collectionBlock(subModel);
    }
    
}

@end
