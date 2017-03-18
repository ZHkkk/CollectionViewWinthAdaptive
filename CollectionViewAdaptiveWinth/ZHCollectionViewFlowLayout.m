//
//  ZHCollectionViewFlowLayoutZH.m
//  CollectionViewAdaptiveWinth
//
//  Created by chaoxing-dev on 17/3/16.
//  Copyright © 2017年 chaoxing-dev. All rights reserved.
//

#import "ZHCollectionViewFlowLayout.h"
@interface ZHCollectionViewFlowLayout ()
@property(nonatomic,assign)CGRect lastItemFrame;

@property(nonatomic,strong)NSMutableArray *  attributesArray;

@end
@implementation ZHCollectionViewFlowLayout
static int const margin = 10;

-(void)prepareLayout
{
    
    self.attributesArray = [NSMutableArray array];
    
    [super prepareLayout];
    
    NSInteger sectionS = [self.collectionView numberOfSections];
    
    for (int j = 0; j < sectionS; j++) {
        NSInteger rows = [self.collectionView numberOfItemsInSection:j];
        
        for (int i = 0 ; i < rows; i ++) {
            NSIndexPath * indexPath = [NSIndexPath indexPathForRow:i inSection:j];
            UICollectionViewLayoutAttributes * layoutAttributeds = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat itemW = [self.delegate collectionView:self.collectionView Customlayout:self sizeForItemAtIndexPath:indexPath];
            
            if (i == 0 && j == 0) {
                layoutAttributeds.frame = CGRectMake(margin, margin, itemW, 30);
            }else
            {
                CGFloat itemX = 0.0;
                
                CGFloat itemY = 0.0;
                
                if (CGRectGetMaxX(self.lastItemFrame) + margin + itemW > self.collectionView.frame.size.width) {
                    itemY = CGRectGetMaxY(self.lastItemFrame) + margin;
                    itemX = margin;
                }else
                {
                    itemY = self.lastItemFrame.origin.y;
                    itemX = CGRectGetMaxX(self.lastItemFrame) + margin;
                }
                
                layoutAttributeds.frame = CGRectMake(itemX, itemY, itemW, 30);
                
            }
            
            [self.attributesArray addObject:layoutAttributeds];
            
            self.lastItemFrame = layoutAttributeds.frame;
        }
    }
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *allAttributes = [NSMutableArray arrayWithCapacity:self.attributesArray.count];
    
    [self.attributesArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UICollectionViewLayoutAttributes * attributes = obj;
        if (CGRectIntersectsRect(rect, attributes.frame)) {
            [allAttributes addObject:attributes];
        }
    }];
    
    return self.attributesArray;
}

-(CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.frame.size.width, CGRectGetMaxY(self.lastItemFrame) + 10);
}


@end
