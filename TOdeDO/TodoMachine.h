//
//  TodoMachine.h
//  TOdeDO
//
//  Created by Patrik Rikama Hinnenberg on 2018-01-26.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoTableViewController.h"
///Solution v2, import todotask
#import "TodoTasks.h"

static const int sectionTodo = 0;
static const int sectionDone = 1;

//add delegate? : NSObject <ArrayDataProtocol>
@interface TodoMachine : NSObject

@property NSString *testmessage;
@property (nonatomic) NSMutableArray *todosArray;
@property (nonatomic) NSDictionary *noteDictionary;

- (void) addTask:(NSString*)taskTitle taskNotes:(NSString*)taskNote starButton:(NSString*)starButtonValue;

- (NSInteger) numberOfTasks;
- (NSDictionary*)getTaskForRow:(NSInteger)rowNumber;

///Solution v2, init method
-(instancetype)init;
-(void)addTodo:(TodoTasks*)todoTask;
///getter som returnerar immutable mode
-(NSArray*)getAllTodos;
-(NSArray *)getTodosForSection:(int)section;


@end
