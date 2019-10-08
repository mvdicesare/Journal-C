//
//  MVDEntry.m
//  JournalOBJ-C
//
//  Created by Michael Di Cesare on 10/7/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import "MVDEntry.h"


static NSString * const title = @"title";
static NSString * const bodyText = @"bodyText";
static NSString * const timestamp = @"timestamp";



@implementation MVDEntry

- (id)initWithTitle:(NSString *)title bodyText:(NSString *)bodyText timestamp:(NSDate *)timestamp
{
    self = [Super init];
    if (self)
    {
        _title = title;
        _bodyText = bodyText;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictonary *)dictionary
{
    NSString *title = dictionary[title];
    NSString *bodyText = dictionary[bodyText];
    NSDate *timestamp = timestamp;
    return [self initWithTitle:title text:text timestamp:timestamp];
}
@end
