//
//  GBViewController.m
//  GREBee
//
//  Created by Ophio Admin on 02/01/14.
//  Copyright (c) 2014 Techno. All rights reserved.
//

#import "GBViewController.h"
#import "WordDetails.h"
#import "GBAppDelegate.h"


@interface GBViewController ()
- (IBAction)wordListButton:(id)sender;
@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation GBViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.managedObjectContext = ((GBAppDelegate*)[UIApplication sharedApplication].delegate).managedObjectContext;
    //[self someDummyData];
}

-(void)someDummyData{
    int now=20;     // set number of words
    for (int i=0; i<now; ++i){
        WordDetails * newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"WordDetails" inManagedObjectContext:self.managedObjectContext];
        newEntry.word = [NSString stringWithFormat:@"word %i",i];
        newEntry.pos = [NSString stringWithFormat:@"pos (V)"];
        newEntry.meaning = [NSString stringWithFormat:@"meaning %i",i];
        newEntry.example = [NSString stringWithFormat:@"example %i",i];
        NSError *error;
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
    }
    
    NSArray *allWords;
    NSError *error;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"WordDetails" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    allWords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
     for (int i=0; i<now; ++i){
         
         NSSet *dealSet = [[NSSet alloc] init];
         for(int j=0;j<now;j+=4){
             dealSet = [dealSet setByAddingObject:[allWords objectAtIndex:j]];
         }
         ((WordDetails*)[allWords objectAtIndex:i]).antonyms = dealSet;
         ((WordDetails*)[allWords objectAtIndex:i]).synonyms = dealSet;
         if (![self.managedObjectContext save:&error]) {
             NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
         }
     }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)wordListButton:(id)sender {
    
    [self performSegueWithIdentifier:@"showWordList" sender:self];
}


@end
