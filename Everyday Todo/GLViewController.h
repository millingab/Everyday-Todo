//
//  GLViewController.h
//  Everyday Todo
//
//  Created by Gab on 2014-09-20.
//  Copyright (c) 2014 Gab Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLAddTaskViewController.h"
#import "GLDetailTaskViewController.h"

@interface GLViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,GLAddTaskViewControllerDelegate,GLDetailTaskViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *taskObjects;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)addBarButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)editBarButtonPressed:(UIBarButtonItem *)sender;

@end
