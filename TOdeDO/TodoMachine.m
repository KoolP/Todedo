//
//  TodoMachine.m
//  TOdeDO
//
//  Created by Patrik Rikama Hinnenberg on 2018-01-26.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

#import "TodoMachine.h"


@implementation TodoMachine

/*
-(void) addNew:(NSString*) note{
    [self.todos addObject:note];
}*/

//Create Array

 //TestArray
 //self.toDos = @[@{@"title" : @"Yoga just do it"}].mutableCopy;


- (void) addTask:(NSString*)taskTitle taskNotes:(NSString*)taskNote starButton:(NSString*)starButtonValue {
    NSLog(@"Entered addTask method!");
    self.todos = [[NSMutableArray alloc]init];
    NSDictionary *noteDictionary = @[@{@"noteTitle":taskTitle,@"taskNotes":taskNote,@"starButtonValue":starButtonValue}].mutableCopy;
    [self.todos addObject:noteDictionary];
    for (NSString *text in self.todos) {
        NSLog(@"%@",text);
    }
    
}

/*-(NSDictionary*) getTaskForRow:(NSInteger)rowNumber {
    return [self.todos.mutableCopy objectAtIndex:rowNumber];
}*/

/*- (NSInteger) numberOfTasks {
    NSLog(@"Number of tasks: %ld", self.todos.count);
    return self.todos.count;
}*/

/*//skapa AddedTask dictonary
-(void)fillDictionary: (NSString*)taskTitle taskNotes:(NSString*)taskNote starButton:(BOOL)starButtonValue{
    NSDictionary *noteDictonary = @{@"noteTitle":taskTitle,@"taskNotes":taskNote,@"starButtonValue":starButtonValue};
}*/

//self.noteDictonary = [[TodoMachine alloc] init];




 
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *todoItems =
}
*/

@end
