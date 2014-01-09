//
//  GBWordMeaningCell.m
//  GREBee
//
//  Created by Ophio Admin on 04/01/14.
//  Copyright (c) 2014 Techno. All rights reserved.
//

#import "GBWordMeaningCell.h"

@interface GBWordMeaningCell ()

@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UILabel *meaningLabel;
@property (weak, nonatomic) IBOutlet UILabel *exampleLabel;
@property (weak, nonatomic) IBOutlet UIView *antonymView;
@property (weak, nonatomic) IBOutlet UIView *synonymView;

@end

@implementation GBWordMeaningCell

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"WordMeaningCell" owner:self options:nil] objectAtIndex:0];
    }
    return self;
}

-(void)setData:(WordDetails *)wordDetail{
    self.wordLabel.text = wordDetail.word;
    self.meaningLabel.text = wordDetail.meaning;
    self.exampleLabel.text = wordDetail.example;
    [self addButtonsInView:self.antonymView withData:wordDetail.antonyms];
    [self addButtonsInView:self.synonymView withData:wordDetail.synonyms];
}

-(void)addButtonsInView:(UIView *)view withData:(NSSet *)set{
    view.backgroundColor = [UIColor grayColor];
    NSArray * array = [set allObjects];
    int originX = 5,originY=0,fixedheight=22;
    for (WordDetails * word in array) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
        CGSize ss = [word.word sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0] }];
        [button setTitle:word.word forState:UIControlStateNormal];
        if(originX+ss.width+25>view.frame.size.width-5)
        {   originY+=25;
            originX=5;
        }
        [button setFrame:CGRectMake(originX,originY,ss.width+25,fixedheight)];
        originX+=ss.width+25;
        [view addSubview:button];
    }
}

-(void)buttonTapped{
    [self.delegate scrollToWord:0];
}


@end
