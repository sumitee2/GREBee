//
//  GBWordListCell.m
//  GREBee
//
//  Created by Ophio Admin on 03/01/14.
//  Copyright (c) 2014 Techno. All rights reserved.
//

#import "GBWordListCell.h"

@interface GBWordListCell ()
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UILabel *meaningLabel;

@end

@implementation GBWordListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"wordListCell" owner:self options:nil] objectAtIndex:0];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
}

-(void)setWord:(NSString*)word andMeaning:(NSString*)meaning{
    self.wordLabel.text = word;
    self.meaningLabel.text=meaning;
}

@end
