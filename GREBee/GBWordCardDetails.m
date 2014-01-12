//
//  GBWordCardDetails.m
//  GREBee
//
//  Created by stc-fueled on 1/10/14.
//  Copyright (c) 2014 Techno. All rights reserved.
//

#import "GBWordCardDetails.h"

@implementation GBWordCardDetails
- (IBAction)goBackToWhereYouCameFromAndSuch:(id)sender {
  [UIView transitionFromView:self toView:self.siblingCell.contentView duration:1 options:UIViewAnimationOptionTransitionCurlDown completion:^(BOOL finished) {
  }];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      self = [[[NSBundle mainBundle] loadNibNamed:@"WordCardDetails" owner:self options:nil] objectAtIndex:0];
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
