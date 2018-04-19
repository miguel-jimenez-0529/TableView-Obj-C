//
//  ViewController.m
//  TableView Obj-C
//
//  Created by Macbook Pro on 19/04/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

#import "ViewController.h"
#import "Course.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray<Course *> *courses;
@end

@implementation ViewController

NSString *cellID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCourses];
    self.navigationItem.title = @"Courses";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    [self.tableView registerClass: UITableViewCell.class forCellReuseIdentifier:cellID];
}

- (void) setupCourses {
    self.courses = NSMutableArray.new;
    
    Course *course = Course.new;
    course.name = @"Instagram Firebase";
    course.numberOfLessons = @(49);
    Course *course2 = [[Course alloc] init];
    course2.name = @"Facebook Google cloud";
    [self.courses addObject: course];
    [self.courses addObject:course2];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.courses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    Course *course = self.courses[indexPath.row];
    cell.textLabel.text = course.name;
    return cell;
}

@end
