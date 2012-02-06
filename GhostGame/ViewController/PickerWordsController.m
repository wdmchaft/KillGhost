//
//  PickerWordsController.m
//  GhostGame
//
//  Created by  on 12-2-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PickerWordsController.h"
#import "Words.h"
#import "WordsManager.h"
#import "PickerWordsCell.h"

@implementation PickerWordsController
@synthesize wordsArray;
@synthesize wordsTable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    WordsManager *wordsManager = [[[WordsManager alloc] init] autorelease];
    self.wordsArray = [wordsManager getAllWords];
    //[wordsManager release];
}

- (void)viewDidUnload
{
    [self setWordsTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [wordsArray release];
    [wordsTable release];
    [super dealloc];
}

#pragma mark - tableView data source delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.wordsArray count];
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"pickerWords";
    
    PickerWordsCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if (cell == nil) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PickerWordsCell" owner:self options:nil];
        for (id oneObject in nib) {
            if ([oneObject isKindOfClass:[PickerWordsCell class]])
                cell = (PickerWordsCell *)oneObject;
        }
    }
    
    Words *word = [self.wordsArray objectAtIndex:indexPath.row];
    
    cell.civilianWordLabel.text = word.civilianWord;
    cell.foolWordLabel.text = word.foolWord;
    
    return cell;
}



#pragma mark - tableView delegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",[self.wordsArray count]);
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath { 
    return NO; 
}

@end
