//
//  WordDetails.h
//  GREBee
//
//  Created by Ophio Admin on 08/01/14.
//  Copyright (c) 2014 Techno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WordDetails;

@interface WordDetails : NSManagedObject

@property (nonatomic, retain) NSString * word;
@property (nonatomic, retain) NSString * pos;
@property (nonatomic, retain) NSString * meaning;
@property (nonatomic, retain) NSString * example;
@property (nonatomic, retain) NSSet *synonyms;
@property (nonatomic, retain) NSSet *antonyms;
@end

@interface WordDetails (CoreDataGeneratedAccessors)

- (void)addSynonymsObject:(WordDetails *)value;
- (void)removeSynonymsObject:(WordDetails *)value;
- (void)addSynonyms:(NSSet *)values;
- (void)removeSynonyms:(NSSet *)values;

- (void)addAntonymsObject:(WordDetails *)value;
- (void)removeAntonymsObject:(WordDetails *)value;
- (void)addAntonyms:(NSSet *)values;
- (void)removeAntonyms:(NSSet *)values;

@end
