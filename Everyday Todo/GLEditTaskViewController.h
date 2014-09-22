//
//  GLEditTaskViewController.h
//  Everyday Todo
//
//  Created by Gab on 2014-09-20.
//  Copyright (c) 2014 Gab Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLTaskModel.h"

@protocol GLEditTaskViewControllerDelegate <NSObject>

-(void)didUpdateTask;

@end

@interface GLEditTaskViewController : UIViewController <UITextViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) GLTaskModel *task;
@property (weak, nonatomic) id <GLEditTaskViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *editTaskTitleTextField;
@property (strong, nonatomic) IBOutlet UITextView *editTaskDescriptionTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *editDatePickerValue;

- (IBAction)saveBarButtonPressed:(UIBarButtonItem *)sender;

@end
