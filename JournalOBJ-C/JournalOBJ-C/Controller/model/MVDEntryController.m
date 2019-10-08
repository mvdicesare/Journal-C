//
//  MVDEntryController.m
//  JournalOBJ-C
//
//  Created by Michael Di Cesare on 10/7/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import "MVDEntryController.h"
//creates a mutable array
static NSString * const entry = @"entries";

@interface MVDEntryController ()
@property (nonatomic, strong) NSMutableArray<MVDEntry *> * entriesMA;

@end


@implementation MVDEntryController
// singleton
+(MVDEntryController *)sharedController {
    static MVDEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [MVDEntryController new];
        [sharedInstance loadFromPersistentStorage];
    });
    return sharedInstance;
}
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _entriesMA = [NSMutableArray array];
    }
    return self;
}


- (NSArray*)entries {return self.entriesMA;}
// add

-(void)addEntryAt:(MVDEntry *)entry
{
    [self.entriesMA addObject:entry];
}
// remove 
-(void)removeObjectAt:(MVDEntry *)entry
{
        [self.entriesMA removeObject:entry];
}


// save

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDict = [NSMutableArray array];
    
    for (MVDEntry *entry in self.entries)
    {
        [entryDict addObject:entry.dictionaryWithEntry];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entryDict forKey:entry];
}

-(void)loadFromPersistentStorage
{
    NSArray *entryDict = [[NSUserDefaults standardUserDefaults] objectForKey:entry];
    for (NSDictionary *dictionaty in entryDict)
    {
        MVDEntry *entry = [[MVDEntry alloc] initWithDictionary:dictionaty];
        [self addEntryAt:entry];
    }
}

@end




//import Foundation
//class EntryController {
//
//    static let sharedInstance = EntryController()
//
//    var entries: [Entry] = [] murablearray 
//
//
//
//    func addEntryWith(title: String, bodyText: String) {
//        let newEntry = Entry(title: title, bodyText: bodyText)
//        entries.append(newEntry)
//    }
//
//    func remove(entry: Entry) {
//        guard let entryIndex = entries.firstIndex(of: entry) else {return}
//            entries.remove(at: entryIndex)
//    }
//
//    func update(entry: Entry, with title: String, bodyText: String) {
//        entry.title = title
//        entry.bodyText = bodyText
//
//    }
//
//    // MARK: - Persistence
//
//    // step one: Create the file storage location
//
//    func createFileForPersistence() -> URL {
//        // Grab the users Document Directory
//        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        // Create the new fileURL on the user phone
//        let fileURL = urls[0].appendingPathComponent("Journal.json")
//        return fileURL
//
//    }
//    // Step 2
//
//    func saveToPersistentStore(){
//        // Create an instance of json encoder
//        let jsonEncoder = JSONEncoder()
//        // attemp to convert playlist array to JSON
//        do {
//            let jsonJournal = try jsonEncoder.encode(entries)
//            // with the new JSON (d) playlist array save it to the users device
//            try jsonJournal.write(to: createFileForPersistence())
//        } catch let encodeingError {
//            // Handle the rttot , if there is one.
//            print("There was an error saving the data!!!!!! \(encodeingError.localizedDescription)")
//        }
//    }
//
//    // step 3
//
//    func loadFromPersistantStore() {
//        // the data we retuieve will be in JSON, and i want it to be a playlist array
//
//        let jsonDecoder = JSONDecoder()
//        // lets try and restore the data
//        do {
//            // try to create a data object from whatever lives at that file location
//            let jsonData = try Data(contentsOf: createFileForPersistence())
//            // try to create an array of Playlist objects from the data we just created
//            let decodedEntryArray = try jsonDecoder.decode([Entry].self, from: jsonData)
//            entries = decodedEntryArray
//        } catch let encodeingError {
//            // Handle the error
//            print("There was an error loading the data !!!!\(encodeingError.localizedDescription)")
//
//        }
//    }
//
//
//
//
//
//} // end of class
