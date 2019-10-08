//
//  MVDEntryTableViewController.m
//  JournalOBJ-C
//
//  Created by Michael Di Cesare on 10/7/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import "MVDEntryTableViewController.h"
#import "MVDEntryDetailViewController.h"
#import "MVDEntryController.h"

@interface MVDEntryTableViewController ()
@end

@implementation MVDEntryTableViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}


#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[MVDEntryController sharedController] entries] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryTitleCell" forIndexPath:indexPath];
    
    MVDEntryController *entryCotroller = [MVDEntryController sharedController];
    MVDEntry *entry = entryCotroller.entries[indexPath.row];
   
    // need to fix date formater***************************
    
    cell.textLabel.text = entry.title;
    cell.detailTextLabel.text = entry.bodyText;
    
    return cell;
}





#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toDetailVIew"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        MVDEntry *entry = [MVDEntryController sharedController].entries[indexPath.row];
        MVDEntryDetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.entry = entry;
    }
}


@end
