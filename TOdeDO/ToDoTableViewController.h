//
//  ToDoTableViewController.h
//  TOdeDO
//
//  Created by Patrik Rikama Hinnenberg on 2018-01-30.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoMachine.h"

@protocol ArrayDataProtocol
-(void)logDelegate;
@end

@interface ToDoTableViewController : UITableViewController

//@property (nonatomic) id<ArrayDataProtocol> delegate;
//@property (nonatomic) TodoMachine *todomachine;

@end
