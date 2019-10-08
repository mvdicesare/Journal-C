//
//  MVDEntryController.h
//  JournalOBJ-C
//
//  Created by Michael Di Cesare on 10/7/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVDEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVDEntryController : NSObject

+(MVDEntryController *)sharedController;

- (void)saveToPersistentStorage;

@property (nonatomic,strong, readonly) NSArray *entries;
-(void)addEntryAt:(MVDEntry *)entry;
-(void)removeObjectAt:(MVDEntry *)entry;


@end

NS_ASSUME_NONNULL_END
