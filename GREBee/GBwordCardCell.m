//
//  GBwordCardCell.m
//  GREBee
//
//  Created by Ophio Admin on 03/01/14.
//  Copyright (c) 2014 Techno. All rights reserved.
//

#import "GBwordCardCell.h"
#import "GBWordCardDetails.h"

@interface GBwordCardCell ()
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property GBWordCardDetails * siblingCell;
@end

@implementation GBwordCardCell

- (IBAction)showMeaning:(id)sender {
  
  self.siblingCell = [[GBWordCardDetails alloc] initWithFrame:CGRectMake(0, 0, 250, 300)];
  
  self.siblingCell.siblingCell = self;
  
  [UIView transitionFromView:self.contentView toView:self.siblingCell duration:1 options:UIViewAnimationOptionTransitionCurlUp completion:^(BOOL finished) {
    
  }
   ];
}
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"wordCardCell" owner:self options:nil] objectAtIndex:0];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
