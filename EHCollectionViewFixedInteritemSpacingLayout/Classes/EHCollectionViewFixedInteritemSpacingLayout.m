//
//  EHCollectionViewFixedInteritemSpacingLayout.m
//  WFEDemo
//
//  Created by Eric Huang on 16/12/14.
//  Copyright © 2016年 Eric Huang. All rights reserved.
//

#import "EHCollectionViewFixedInteritemSpacingLayout.h"

@implementation EHCollectionViewFixedInteritemSpacingLayout

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];

    for (int i = 1; i < attributes.count; i++) {
        UICollectionViewLayoutAttributes *previousAttribute = attributes[i-1];
        UICollectionViewLayoutAttributes *currentAttribute = attributes[i];

        // adjust when on the same row
        if (CGRectGetMinX(previousAttribute.frame) < CGRectGetMinX(currentAttribute.frame)) {
            CGRect frame = currentAttribute.frame;
            frame.origin.x = CGRectGetMaxX(previousAttribute.frame) + self.minimumInteritemSpacing;
            currentAttribute.frame = frame;
        }
    }

    return attributes;
}

@end
