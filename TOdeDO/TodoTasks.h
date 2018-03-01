//
//  TodoTasks.h
//  TOdeDO
//
//  Created by Patrik Rikama Hinnenberg on 2018-03-01.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

#import <Foundation/Foundation.h>

//Serialisering av userdefaults, Encode och init coder. Encode ändrar Init ladd
@interface TodoTasks : NSObject <NSCoding>

@property (nonatomic) NSString *title;
@property (nonatomic) BOOL important;
@property (nonatomic) BOOL done;
@property (nonatomic) NSString *note;

- (instancetype) initWithTitle:(NSString *)title
                     important:(BOOL)isImportant
                          done:(BOOL)isDone
                          note:(NSString *)note;
@end
