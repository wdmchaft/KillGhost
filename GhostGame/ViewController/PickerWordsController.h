//
//  PickerWordsController.h
//  GhostGame
//
//  Created by  on 12-2-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Words;
@protocol PickWordsDelegate <NSObject>
@optional
- (void)didPickedWords:(Words *)words;

@end

@interface PickerWordsController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (retain, nonatomic) NSString *category;
@property (retain, nonatomic) NSArray *wordsArray;
@property (retain, nonatomic) IBOutlet UITableView *wordsTable;
@property (assign,nonatomic) int selectCellIndex;
@property (nonatomic, assign) id<PickWordsDelegate> delegate;
@property (retain, nonatomic) IBOutlet UILabel *viewTitleLabel;
@property (retain, nonatomic) IBOutlet UILabel *civilianWordLabel;
@property (retain, nonatomic) IBOutlet UILabel *foolWordLabel;
@property (retain, nonatomic) IBOutlet UILabel *backLabel;

- (IBAction)clickBack:(id)sender;

- (id)initWithCategory:(NSString *)categoryValue;

@end
