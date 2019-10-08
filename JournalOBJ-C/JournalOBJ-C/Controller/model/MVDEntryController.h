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

-(void)addEntry:(NSString *)title
       bodyText:(NSString *)bodyText
      timestamp:(NSDate *)timestamp;

-(void)removeObjectAt:(Entry *)index;


@end

NS_ASSUME_NONNULL_END
