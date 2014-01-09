//
//  GBWordListVC.m
//  GREBee
//
//  Created by Ophio Admin on 03/01/14.
//  Copyright (c) 2014 Techno. All rights reserved.
//

#import "GBWordListVC.h"
#import "GBWordListCell.h"
#import "GBWordMeaningViewController.h"
#import "GBAppDelegate.h"
#import "WordDetails.h"

@interface GBWordListVC ()
@property NSDictionary * dict;
@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@end

@implementation GBWordListVC

NSArray * GBRoad;

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
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return GBRoad.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GBWordListCell* cell;
    cell = (GBWordListCell *)[tableView dequeueReusableCellWithIdentifier:@"wordListCell"];
    if(!cell){
        cell = [[GBWordListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"wordListCell"];
    }
    WordDetails * word =  [GBRoad objectAtIndex:indexPath.row];
    [cell setWord: word.word andMeaning:word.meaning];
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
  GBWordMeaningViewController *vc =
  [storyboard instantiateViewControllerWithIdentifier:@"wmVC"];
  [vc showWordWithIndex:indexPath.row];
  [self presentViewController:vc
                     animated:YES
                   completion:nil];
  [vc showWordWithIndex:indexPath.row];
}

-(void)getData{    
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"WordDetails" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    GBRoad = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
}

@end
