//
//  ToDoTableViewController.m
//  TOdeDO
//
//  Created by Patrik Rikama Hinnenberg on 2018-01-30.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

#import "ToDoTableViewController.h"
#import "TodoMachine.h"
#import "ToDoTableViewCell.h"
#import "SimpleAddViewController.h"


@interface ToDoTableViewController ()

///Solution v2, property of todomachine
@property (nonatomic) TodoMachine *todomachine;
@property (nonatomic) NSMutableArray *todosArray;
@property (nonatomic) NSDictionary *noteDictionary;
@end

@implementation ToDoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ///Solution v2, property of todomachine
    self.todomachine = [[TodoMachine alloc] init];
    
    [self.todomachine addTodo:[[TodoTasks alloc] initWithTitle:@"Just do it" important:NO done:NO note:@"buy the nike shoes"]];
    [self.todomachine addTodo:[[TodoTasks alloc] initWithTitle:@"Wake up" important:YES done:NO note:@""]];
    [self.todomachine addTodo:[[TodoTasks alloc] initWithTitle:@"Run" important:YES done:YES note:@"Looking to do some 15km"]];
    

    //Skapa custom nav patplusbutton
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"patplus.png"] style:UIBarButtonItemStylePlain target:self action:@selector(addNoteButtonPushed:)];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

// Custom patPlusbutton action
-(void) addNoteButtonPushed:(UIButton*)sender
{
     [self performSegueWithIdentifier:@"addSegue" sender:self];
}

// Reloads data to view when entered again?
-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *filterTodos = [self.todomachine getTodosForSection:(int)section];
    return filterTodos.count;
    //Only one section in TblView
    //return self.todomachine.getAllTodos.count;
    
}


//Indexpath innehåller section och row,pointer mot cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toDoCell" forIndexPath:indexPath];
    
    // Configure the cell
    ///Solution v2,
    NSArray *filterTodos = [self.todomachine getTodosForSection:(int)indexPath.section];
    TodoTasks *todoTask = filterTodos[indexPath.row];
    cell.todoTitle.text = todoTask.title;
    cell.todoNote.text = todoTask.note;
    //cell.todoStar.image = (todoTask.important);
    if (todoTask.important == TRUE) {
        cell.todoStar.image = [UIImage imageNamed:@"patrikStar4.png"];
    }
    
    //Only one list
    //TodoTasks *todoTask = self.todomachine.getAllTodos[indexPath.row];
 
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == sectionTodo) {
        return @"Todo";
    } else if(section == sectionDone) {
        return @"Done";
    }else {
        return @"";
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    SimpleAddViewController *add = segue.destinationViewController;
    add.todomachine = self.todomachine;
    
    if([segue.identifier isEqualToString:@"editSegue"]) {
        ToDoTableViewCell *cell = sender;
        UIViewController *taskEdit = [segue destinationViewController];
        taskEdit.title = cell.todoTitle.text;
    }/*else if([segue.identifier isEqualToString:@"addSegue"]){
        TodoMachine *add = [segue destinationViewController];
        add.noteDictionary = self.noteDictionary;
    }*/
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
