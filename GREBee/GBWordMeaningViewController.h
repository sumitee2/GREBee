//
//  GBWordMeaningViewController.h
//  GREBee
//
//  Created by Ophio Admin on 04/01/14.
//  Copyright (c) 2014 Techno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBWordMeaningCell.h"

@interface GBWordMeaningViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,WordMeaningCellDelegate>

@property NSDictionary * dict;
-(void)showWordWithIndex:(NSInteger)index;

@end
