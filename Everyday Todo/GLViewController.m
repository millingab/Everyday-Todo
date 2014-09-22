//
//  GLViewController.m
//  Everyday Todo
//
//  Created by Gab on 2014-09-20.
//  Copyright (c) 2014 Gab Labs. All rights reserved.
//

#import "GLViewController.h"

@interface GLViewController ()

@end

@implementation GLViewController

-(NSMutableArray *)taskObjects
{
    if (!_taskObjects)
        _taskObjects = [[NSMutableArray alloc]init];
    
    return _taskObjects;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // UITableViewDelegate and UITableViewDataSource are connected to View Controller in storyboard (self.tableview.delegate = self and self.tableview.datasource = self) etc
    NSArray *taskObjectsAsPropertyLists = [[NSUserDefaults standardUserDefaults] arrayForKey:ARRAY_KEY];
    
    for (NSDictionary *dictionary in taskObjectsAsPropertyLists) {
        GLTaskModel *taskObject = [self propertyListAsTaskObject:dictionary];
        [self.taskObjects addObject:taskObject];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass: [GLAddTaskViewController class]] ) {
        GLAddTaskViewController *nextViewController = segue.destinationViewController;
        nextViewController.delegate = self;
    }
}

#pragma mark - Helper methods
-(NSDictionary *)taskObjectAsPropertyList: (GLTaskModel *)taskObject
{
    NSDictionary *taskDictionary = @{TASK_TITLE: taskObject.title, TASK_DESCRIPTION: taskObject.description,TASK_DATE: taskObject.date, TASK_COMPLETION:  @(taskObject.completion)};
    return taskDictionary;
}

-(GLTaskModel *)propertyListAsTaskObject: (NSDictionary *)dictionary
{
    GLTaskModel *taskObject = [[GLTaskModel alloc] initWithData:dictionary];
    
    return taskObject;
}

- (BOOL)isDateGreaterThanDate:(NSDate*)date and:(NSDate*)toDate
{
    NSTimeInterval date1 = [date timeIntervalSince1970];
    NSTimeInterval date2 = [toDate timeIntervalSince1970];
    
    if (date1 < date2) {
        return YES;
    }
    else {
        return NO;
    }
}

-(void)updateCompletetionOfTask:(GLTaskModel *)task forIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *taskObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:ARRAY_KEY] mutableCopy];
    if (!taskObjectsAsPropertyLists) {
        taskObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    }
    
    [taskObjectsAsPropertyLists removeObjectAtIndex: indexPath.row];
    
    if (task.completion)
        task.completion = NO;
    else
        task.completion = YES;
    
    [taskObjectsAsPropertyLists insertObject:[self taskObjectAsPropertyList:task] atIndex:indexPath.row];
    
    [[NSUserDefaults standardUserDefaults] setObject:taskObjectsAsPropertyLists forKey:ARRAY_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.tableView reloadData];
}
    


#pragma mark - UITableViewDataSource methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.taskObjects count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TaskCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    GLTaskModel *task = self.taskObjects[indexPath.row];
    cell.textLabel.text = task.title;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *stringFromDate = [formatter stringFromDate:task.date];
    
    cell.detailTextLabel.text = stringFromDate;
    
    BOOL isOverdue = [self isDateGreaterThanDate:task.date and:[NSDate date]];
    if (task.completion) {
        cell.backgroundColor = [UIColor greenColor];
    }
    else {
    
    if (isOverdue)
        cell.backgroundColor = [UIColor redColor];
    else
        cell.backgroundColor = [UIColor yellowColor];
    }
    
    return cell; 
}

#pragma mark - UITableViewDelegate methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GLTaskModel *task = self.taskObjects[indexPath.row];
    [self updateCompletetionOfTask:task forIndexPath:indexPath];
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.taskObjects removeObjectAtIndex:indexPath.row];
        
        NSMutableArray *taskObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:ARRAY_KEY] mutableCopy];
        
        [taskObjectsAsPropertyLists removeObjectAtIndex:indexPath.row];
        
        [[NSUserDefaults standardUserDefaults] setObject:taskObjectsAsPropertyLists forKey:ARRAY_KEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [self.tableView reloadData];
    }
}

#pragma mark - GLAddTaskViewControllerDelegate methods

-(void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didAddTask:(GLTaskModel *)task
{
    [self.taskObjects addObject:task];
    NSMutableArray *taskObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:ARRAY_KEY] mutableCopy];
    if (!taskObjectsAsPropertyLists) {
        taskObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    }
    [self taskObjectAsPropertyList:task];
    
    NSDictionary *dictionary = [self taskObjectAsPropertyList:task];
    [taskObjectsAsPropertyLists addObject:dictionary];
    [[NSUserDefaults standardUserDefaults] setObject:taskObjectsAsPropertyLists forKey: ARRAY_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];
}

#pragma mark - IB Actions

- (IBAction)editBarButtonPressed:(UIBarButtonItem *)sender
{
    
}

- (IBAction)addBarButtonPressed:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"toAddTask" sender:nil];
}
@end
