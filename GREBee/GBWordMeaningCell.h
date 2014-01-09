//
//  GBWordMeaningCell.h
//  GREBee
//
//  Created by Ophio Admin on 04/01/14.
//  Copyright (c) 2014 Techno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordDetails.h"

@protocol WordMeaningCellDelegate ;
@interface GBWordMeaningCell : UICollectionViewCell

@property (nonatomic,strong) id<WordMeaningCellDelegate> delegate;
-(void)setData:(WordDetails *)wordDetail;

@end
@protocol WordMeaningCellDelegate <NSObject>

-(void) scrollToWord:(int) index;

@end
