//
//  TodoTasks.m
//  TOdeDO
//
//  Created by Patrik Rikama Hinnenberg on 2018-03-01.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

#import "TodoTasks.h"

NSString *keyTitle = @"Title";
NSString *keyImportant = @"Important";
NSString *keyDone = @"Done";
NSString *keyNote = @"Note";

@implementation TodoTasks

- (instancetype) initWithTitle:(NSString *)title
                     important:(BOOL)isImportant
                          done:(BOOL)isDone
                          note:(NSString *)note {
    self = [super init];
    if(self) {
        self.title = title;
        self.important = isImportant;
        self.done = isDone;
        self.note = note;
    }
    
    return self;
}

//NSUserdefault will automaticaly call when load, protocol
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.title = [aDecoder decodeObjectForKey:keyTitle];
        self.important = [aDecoder decodeIntegerForKey:keyImportant];
        self.done = [aDecoder decodeIntegerForKey:keyDone];
        self.note = [aDecoder decodeObjectForKey:keyNote];
    }
    return self;
}

//NSUserdefault will automaticaly call when saved, protocol
-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.title forKey:keyTitle];
    [aCoder encodeInteger:self.important forKey:keyImportant];
    [aCoder encodeInteger:self.done forKey:keyDone];
    [aCoder encodeObject:self.note forKey:keyNote];
}

@end
