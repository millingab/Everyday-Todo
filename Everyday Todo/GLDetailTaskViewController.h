//
//  GLDetailTaskViewController.h
//  Everyday Todo
//
//  Created by Gab on 2014-09-20.
//  Copyright (c) 2014 Gab Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLTaskModel.h"

@interface GLDetailTaskViewController : UIViewController

@property (strong, nonatomic) GLTaskModel *task;

@property (strong, nonatomic) IBOutlet UILabel *taskTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *taskDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *taskDateLabel;

- (IBAction)editBarButtonPressed:(UIBarButtonItem *)sender;

@end
