//
//  GBWordMeaningViewController.m
//  GREBee
//
//  Created by Ophio Admin on 04/01/14.
//  Copyright (c) 2014 Techno. All rights reserved.
//

#import "GBWordMeaningViewController.h"
#import "GBWordMeaningCell.h"
#import "GBAppDelegate.h"

@interface GBWordMeaningViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *wmCollectionView;
@property NSIndexPath * scrollTo;
@property NSDictionary * diction;
@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation GBWordMeaningViewController

NSArray *allWords;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.managedObjectContext = ((GBAppDelegate*)[UIApplication sharedApplication].delegate).managedObjectContext;
    [self getData];
    UINib * nib = [UINib nibWithNibName:@"WordMeaningCell" bundle:[NSBundle mainBundle]];
    [self.wmCollectionView registerNib:nib forCellWithReuseIdentifier:@"wordMeaningCell"];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.wmCollectionView scrollToItemAtIndexPath:self.scrollTo atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return allWords.count;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GBWordMeaningCell * cell;
    cell =  [cv dequeueReusableCellWithReuseIdentifier:@"wordMeaningCell" forIndexPath:indexPath];
    if(!cell){
        cell = [[GBWordMeaningCell alloc] initWithFrame:CGRectMake(0, 0, 250, 300)];
    }
    [cell setData:[allWords objectAtIndex:indexPath.row]];
    cell.delegate=self;
    return cell;
}

#pragma mark – UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return CGSizeMake(250, 300);
}

- (UIEdgeInsets)collectionView:
    (UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(74, 35, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
  return 0;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
  return 70;
}

//==============show a particular word===================

-(void)showWordWithIndex:(NSInteger)index{
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    self.scrollTo = indexPath;
}

#pragma mark database functions

-(void)getData{
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"WordDetails" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    allWords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
}

-(void) scrollToWord:(int)word{
//    
  NSIndexPath * indexPath = [NSIndexPath indexPathForItem:word inSection:0];
  [self.wmCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

@end
