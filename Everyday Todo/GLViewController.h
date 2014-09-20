//
//  GLViewController.h
//  Everyday Todo
//
//  Created by Gab on 2014-09-20.
//  Copyright (c) 2014 Gab Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

- (IBAction)addBarButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)editBarButtonPressed:(UIBarButtonItem *)sender;


@end
