//
//  GLEditTaskViewController.m
//  Everyday Todo
//
//  Created by Gab on 2014-09-20.
//  Copyright (c) 2014 Gab Labs. All rights reserved.
//

#import "GLEditTaskViewController.h"

@interface GLEditTaskViewController ()

@end

@implementation GLEditTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.editTaskTitleTextField.text = self.task.title;
    self.editTaskDescriptionTextView.text = self.task.description;
    self.editDatePickerValue.date = self.task.date;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.editTaskDescriptionTextView.delegate = self;
    self.editTaskTitleTextField.delegate = self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveBarButtonPressed:(UIBarButtonItem *)sender
{
    [self updateTask];
    [self.delegate didUpdateTask];
}

-(void)updateTask
{
    self.task.title = self.editTaskTitleTextField.text;
    self.task.description = self.editTaskDescriptionTextView.text;
    self.task.date = self.editDatePickerValue.date;
}


#pragma mark - Delegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.editTaskTitleTextField resignFirstResponder];
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [self.editTaskDescriptionTextView resignFirstResponder];
        return NO;
    }
    return YES;
    
}


@end
