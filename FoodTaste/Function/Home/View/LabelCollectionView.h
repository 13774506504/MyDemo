//
//  LabelCollectionView.h
//  FoodTaste
//
//  Created by shown on 16/3/29.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabelCollectionViewCell.h"
#import "LabelCollectionViewSectionView.h"

@interface LabelCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, copy) void(^collectionBlock)(SubFootModel *model);

@end
