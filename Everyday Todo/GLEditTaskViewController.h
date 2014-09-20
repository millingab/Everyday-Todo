//
//  GLEditTaskViewController.h
//  Everyday Todo
//
//  Created by Gab on 2014-09-20.
//  Copyright (c) 2014 Gab Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLEditTaskViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *editTaskTitleTextField;
@property (strong, nonatomic) IBOutlet UITextView *editTaskDescriptionTextView;
@property (strong, nonatomic) IBOutlet UIDatePicker *editDatePickerValue;

- (IBAction)saveBarButtonPressed:(UIBarButtonItem *)sender;

@end
