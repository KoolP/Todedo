//
//  TodoMachine.h
//  TOdeDO
//
//  Created by Patrik Rikama Hinnenberg on 2018-01-26.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoMachine : NSObject

@property NSString *testmessage;
@property (nonatomic) NSMutableArray *todosArray;
@property (nonatomic) NSDictionary *noteDictionary;

- (void) addTask:(NSString*)taskTitle taskNotes:(NSString*)taskNote starButton:(NSString*)starButtonValue;

- (NSInteger) numberOfTasks;
- (NSDictionary*)getTaskForRow:(NSInteger)rowNumber;

@end
