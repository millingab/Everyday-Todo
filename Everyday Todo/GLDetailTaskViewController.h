//
//  GLDetailTaskViewController.h
//  Everyday Todo
//
//  Created by Gab on 2014-09-20.
//  Copyright (c) 2014 Gab Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLTaskModel.h"
#import "GLEditTaskViewController.h"

@protocol GLDetailTaskViewControllerDelegate <NSObject>

-(void)updateTask;

@end

@interface GLDetailTaskViewController : UIViewController <GLEditTaskViewControllerDelegate>

@property (strong, nonatomic) GLTaskModel *task;
@property (weak, nonatomic) id <GLDetailTaskViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UILabel *taskTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *taskDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *taskDateLabel;

- (IBAction)editBarButtonPressed:(UIBarButtonItem *)sender;

@end
