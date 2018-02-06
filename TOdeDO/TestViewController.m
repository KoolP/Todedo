//
//  TestViewController.m
//  TOdeDO
//
//  Created by Patrik Rikama Hinnenberg on 2018-01-26.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@property (nonatomic) UIButton *starButton;
@property (nonatomic) BOOL importantTask;
@property (nonatomic) UITableViewCell *cellColor;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self starButtonCreate];
    self.importantTask = NO;
    
    //self.view.backgroundColor = [UIColor redColor];
    // Uncomment to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(void) starButtonCreate {
    self.starButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.starButton addTarget:self action:@selector(starButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.starButton setTitle:@"" forState:UIControlStateNormal];
    self.starButton.frame = CGRectMake(300,10,30,30);
    //flagButton.backgroundColor = [UIColor redColor];
    [self.starButton setBackgroundImage: [UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.starButton];
}
    
-(void) starButtonAction {
    if (self.importantTask == NO){
        self.importantTask = YES;
    [self.starButton setBackgroundImage: [UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    NSLog(@"Became important");
    } else {
        self.importantTask = NO;
        [self.starButton setBackgroundImage: [UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
    NSLog(@"Became less important");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headerCell" forIndexPath:indexPath];
    
    
    // Configure the cell...
    
    return cell;
}
*/

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
