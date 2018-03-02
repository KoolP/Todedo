//
//  TodoMachine.m
//  TOdeDO
//
//  Created by Patrik Rikama Hinnenberg on 2018-01-26.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

#import "TodoMachine.h"

///Solution v2, a string that keeps the strign todokey
NSString *todoSaveKey = @"Todos";


///Solution v2, extra private interface
@interface TodoMachine ()
@property (nonatomic) NSMutableArray *todos;
@end



@implementation TodoMachine

///Solution v2, extra private interface
- (instancetype)init {
    self = [super init];
    if(self) {
        NSData *data = [[self defaults] objectForKey:todoSaveKey];
        //convert back to mutable array
        self.todos = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        if(!self.todos) {
            self.todos = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

///Solution v2, private getter for NSUserdefaults for global use
-(NSUserDefaults*)defaults {
    return [NSUserDefaults standardUserDefaults];
}

///Solution v2, add method
-(void)addTodo:(TodoTasks *)todoTask {
    [self.todos addObject:todoTask];
    [self save];
}

///Solution v2, save task method, Först konvertera till NSData blobdata sedan spara
-(void)save {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.todos];
    [[self defaults] setObject:data forKey:todoSaveKey];
}

///Solution v2, get all todos castar om en mutable array till vanlig
-(NSArray*)getAllTodos {
    return self.todos;
}

-(NSArray *)getTodosForSection:(int)section {
    //manuel filtrering
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for(TodoTasks *todoTask in self.todos) {
        if((section == sectionTodo && !todoTask.done) ||
           (section == sectionDone && todoTask.done))  {
            [result addObject:todoTask];
    }
    
}

    return result;
    
}


/*
-(void) addNew:(NSString*) note{
    [self.todos addObject:note];
}*/

//Create Array

 //TestArray
 //self.toDos = @[@{@"title" : @"Yoga just do it"}].mutableCopy;


- (void) addTask:(NSString*)taskTitle taskNotes:(NSString*)taskNote starButton:(NSString*)starButtonValue {
    
    self.todosArray = [[NSMutableArray alloc]init];
    NSDictionary *noteDictionary = @{@"noteTitle":taskTitle,@"taskNotes":taskNote,@"starButtonValue":starButtonValue};
    
    [self.todosArray addObject:noteDictionary];
    
    //Logs
    NSLog(@"Entered addTask method! in TodoMachine");
    //Log dictionary
    NSLog(@"Dictionary: %@", [noteDictionary description]);
    //NS Log Array cotent / count
    //NSLog(@"%@",self.todosArray);
    NSLog(@"%lu",(unsigned long)self.todosArray.count);
    
}

-(NSDictionary*) getTaskForRow:(NSInteger)rowNumber {
    return [self.todosArray.mutableCopy objectAtIndex:rowNumber];
}
- (NSInteger) numberOfTasks {
    NSLog(@"Number of tasks: %ld", self.todosArray.count);
    return self.todosArray.count;
}


@end
