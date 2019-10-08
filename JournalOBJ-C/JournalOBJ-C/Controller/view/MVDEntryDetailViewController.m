//
//  MVDEntryDetailViewController.m
//  JournalOBJ-C
//
//  Created by Michael Di Cesare on 10/7/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

#import "MVDEntryDetailViewController.h"
#import "MVDEntryController.h"

@interface MVDEntryDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *entryTitleField;
@property (weak, nonatomic) IBOutlet UITextView *entryBodyTextField;

@end

@implementation MVDEntryDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateViews];
}
- (void)updateViews
{
    if (!self.entry) return;
    self.entryTitleField.text = self.entry.title;
    self.entryBodyTextField.text = self.entry.bodyText;
}

- (IBAction)savedButtonPressed:(id)sender
{
    if (self.entry)
    {
        self.entry.title = self.entryTitleField.text;
        self.entry.bodyText = self.entryBodyTextField.text;
        self.entry.timestamp = [NSDate date];
    }
    else
    {
        MVDEntry *entry = [[MVDEntry alloc] initWithEntryTitle:self.entryTitleField.text bodytest:self.entryBodyTextField.text timestamp:NSDate.date];
        [[MVDEntryController sharedController] addEntryAt:entry];
                           self.entry = entry;
    }
                           [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clearButtonPressed:(id)sender
{
    self.entryTitleField.text = @"";
    self.entryBodyTextField.text = @"";
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)setEntry:(MVDEntry *)entry
{
    if (entry != _entry)
    {
        _entry = entry;
        [self updateViews];
    }
}








@end
