//
//  GLAddTaskViewController.h
//  Everyday Todo
//
//  Created by Gab on 2014-09-20.
//  Copyright (c) 2014 Gab Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLTaskModel.h"

@protocol GLAddTaskViewControllerDelegate <NSObject>

-(void)didCancel;
-(void)didAddTask:(GLTaskModel*) task;

@end

@interface GLAddTaskViewController : UIViewController

@property (weak, nonatomic) id <GLAddTaskViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *taskTitleTextField;
@property (strong, nonatomic) IBOutlet UITextView *taskDescriptionTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePickerValue;

- (IBAction)addTaskButtonPressed:(UIButton *)sender;
- (IBAction)cancelButtonPressed:(UIButton *)sender;

@end
