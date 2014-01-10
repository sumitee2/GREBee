//
//  GBWordCardViewController.m
//  GREBee
//
//  Created by stc-fueled on 1/10/14.
//  Copyright (c) 2014 Techno. All rights reserved.
//

#import "GBWordCardViewController.h"
#import "GBAppDelegate.h"
#import "GBwordCardCell.h"

@interface GBWordCardViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *wcCollectionView;
@property NSIndexPath * scrollTo;
@property NSDictionary * diction;
@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation GBWordCardViewController
NSArray *allWordsList;

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
  UINib * nib = [UINib nibWithNibName:@"wordCardCell" bundle:[NSBundle mainBundle]];
  [self.wcCollectionView registerNib:nib forCellWithReuseIdentifier:@"wordCardCell"];
}

-(void)viewWillAppear:(BOOL)animated{
    //[self.wcCollectionView scrollToItemAtIndexPath:self.scrollTo atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
  return allWordsList.count;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
  return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  GBwordCardCell * cell;
  cell =  [cv dequeueReusableCellWithReuseIdentifier:@"wordCardCell" forIndexPath:indexPath];
  if(!cell){
    cell = [[GBwordCardCell alloc] initWithFrame:CGRectMake(0, 0, 250, 300)];
  }
    //[cell setData:[allWords objectAtIndex:indexPath.row]];
    //cell.delegate=self;
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
//
//-(void)showWordWithIndex:(NSInteger)index{
//  NSIndexPath * indexPath = [NSIndexPath indexPathForRow:index inSection:0];
//  self.scrollTo = indexPath;
//}

#pragma mark database functions

-(void)getData{
  NSError *error;
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"WordDetails" inManagedObjectContext:self.managedObjectContext];
  [fetchRequest setEntity:entity];
  allWordsList = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
}
//
//-(void) scrollToWord:(int)word{
//    //
//  NSIndexPath * indexPath = [NSIndexPath indexPathForItem:word inSection:0];
//  [self.wcCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
//}

@end
