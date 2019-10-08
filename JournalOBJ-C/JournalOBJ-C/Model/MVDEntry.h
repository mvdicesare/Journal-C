//
//  MVDEntry.h
//  JournalOBJ-C
//
//  Created by Michael Di Cesare on 10/7/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MVDEntry : NSObject

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * bodyText;
@property (nonatomic, copy, readonly) NSDate * timestamp;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
-(NSDictionary*)dictionaryWithEntry;

-(instancetype)initWithEntryTitle:(NSString *) title
                          bodytest:(NSString *) bodyText
                         timestamp:(NSDate *) timestamp;

@end
NS_ASSUME_NONNULL_END
