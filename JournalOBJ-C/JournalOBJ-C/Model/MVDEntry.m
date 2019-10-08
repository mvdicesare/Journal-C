//
//  MVDEntry.m
//  JournalOBJ-C
//
//  Created by Michael Di Cesare on 10/7/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import "MVDEntry.h"


static NSString * const titleEntry = @"title";
static NSString * const bodyTextEntry = @"bodyText";
static NSString * const timestampEntry = @"timestamp";



@implementation MVDEntry

- (instancetype)initWithEntryTitle:(NSString *)title bodytest:(NSString *)bodyText timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self)
    {
        _title = title;
        _bodyText = bodyText;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[titleEntry];
    NSString *bodyText = dictionary[bodyTextEntry];
    NSDate *timestamp = dictionary[timestampEntry];
    return [self initWithEntryTitle:title bodytest:bodyText timestamp:timestamp];
}
- (NSDictionary *)dictionaryWithEntry
{
    return @{titleEntry: self.title,
             bodyTextEntry: self.bodyText,
             timestampEntry: self.timestamp};
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[MVDEntry class]]) {return NO;}
    return [[self dictionaryWithEntry] isEqualToDictionary:[(MVDEntry *) object dictionaryWithEntry]];
}
@end
