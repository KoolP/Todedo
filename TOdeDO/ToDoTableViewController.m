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

@interface ToDoTableViewController ()
@property (nonatomic) TodoMachine *todomachine;
@end

@implementation ToDoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //"Skapa modellen här" -Erik
    self.todomachine = [[TodoMachine alloc] init];
     //Test a cellrow
    //self.todomachine.todosArray = @[@{@"noteTitle" : @"Kolla", @"taskNote" : @"jeppejeppa", @"starButtonValue" : @"YES"}, @{@"noteTitle" : @"Tsiigaa", @"taskNote" : @"jut", @"starButtonValue" : @"NO"}].mutableCopy;

    //Skapa custom nav patplusbutton
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"patplus.png"] style:UIBarButtonItemStylePlain target:self action:@selector(addNoteButtonPushed:)];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

// Custom patPlusbutton action
-(void) addNoteButtonPushed:(UIButton*)sender
{
     [self performSegueWithIdentifier:@"addSegue" sender:self];
}

// Osäker om denna behövs?
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.todomachine.todosArray.count;
    
}


//Indexpath innehåller section och row,pointer mot cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toDoCell" forIndexPath:indexPath];
    
    // Configure the cell
    //NSDictionary *theDictionary = self.todomachine.todosArray[indexPath.row];
    //NSDictionary *theDictionary = [self.todomachine getTaskForRow:indexPath.row];
    cell.todoTitle.text = self.todomachine.todosArray[indexPath.row];
    cell.todoNote.text = self.todomachine.todosArray[indexPath.row];
    cell.todoStar.image = self.todomachine.todosArray[indexPath.row];
    if ([[self.todomachine.noteDictionary objectForKey:@"starButtonValue"] isEqualToString:@"YES"]) {
        cell.todoStar.image = [UIImage imageNamed:@"patrikStar4.png"];
    }
    
    /*
    cell.todoTitle.text = theDictionary[@"noteTitle"];
    cell.todoNote.text = theDictionary[@"taskNotes"];
     */
    
    //Logs
    //NSLog(@"Dictionary: %@", [theDictionary description]);
    /*//Test configure cell
    cell.todoTitle.text = [self.todomachine.noteDictionary objectForKey:@"noteTitle"];
    cell.todoNote.text = [self.todomachine.noteDictionary objectForKey:@"taskNotes"];
    if ([[self.todomachine.noteDictionary objectForKey:@"starButtonValue"] isEqualToString:@"YES"]) {
        cell.todoStar.image = [UIImage imageNamed:@"patrikStar4.png"];
    }*/
    
    // Configure the cell
    //NSMutableArray *toDoArray = [[NSMutableArray alloc]init];
    //NSDictionary *theDictionary = [self.todomachine getTaskForRow:indexPath.row];
    
    /*for (NSString *text in self.todomachine.todos) {
        NSLog(@"%@",text);
    }
    cell.todoTitle.text = [theDictionary objectForKey:@"noteTitle"];
    cell.todoNote.text = [theDictionary objectForKey:@"taskNotes"];
    if ([[theDictionary objectForKey:@"starButtonValue"] isEqualToString:@"YES"]) {
        cell.todoStar.image = [UIImage imageNamed:@"patrikStar4.png"];
        
    // Test section and row index outcommented
    //cell.textLabel.text = [NSString stringWithFormat:@"Section %ld, row %ld", indexPath.section, indexPath.row];
    }*/
    
    return cell;
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
    
    if([segue.identifier isEqualToString:@"editSegue"]) {
        ToDoTableViewCell *cell = sender;
        UIViewController *taskEdit = [segue destinationViewController];
        taskEdit.title = cell.todoTitle.text;
    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
