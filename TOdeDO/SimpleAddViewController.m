//
//  SimpleAddViewController.m
//  TOdeDO
//
//  Created by Patrik Rikama Hinnenberg on 2018-01-29.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

#import "SimpleAddViewController.h"
#import "QuartzCore/QuartzCore.h"
#import "TodoMachine.h"

@interface SimpleAddViewController ()

@property (nonatomic) UIButton *starButton2;
@property (nonatomic) BOOL importantTask2;
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;
@property (weak, nonatomic) IBOutlet UITextField *addTitle;
//@property (nonatomic) NSMutableArray *toDos;
//property for TodoMachine modell


@end

@implementation SimpleAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.todomachine = [[TodoMachine alloc] init];
    [self.addTitle becomeFirstResponder];
    [self starButton2Create];
    self.importantTask2 = NO;
    self.notesTextView.layer.cornerRadius = 8;
    
    
    // Do any additional setup after loading the view.
}


//Custom star button
-(void) starButton2Create {
    self.starButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.starButton2 addTarget:self action:@selector(starButtonAction2) forControlEvents:UIControlEventTouchUpInside];
    [self.starButton2 setTitle:@"" forState:UIControlStateNormal];
    self.starButton2.frame = CGRectMake(310,100,40,40);
    [self.starButton2 setBackgroundImage:[UIImage imageNamed:@"patrikStar3.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.starButton2];
}

//Back button pressed + addTask action
- (void)didMoveToParentViewController:(UIViewController *)parent{
    if (parent == NULL) {
        NSLog(@"Back Pressed");
        NSString *priority;
        if (self.importantTask2) {
            priority = @"YES";
        } else {
            priority = @"NO";
        }
        
        [self.todomachine addTodo:[[TodoTasks alloc] initWithTitle:self.addTitle.text important:self.importantTask2 done:NO note:self.notesTextView.text]];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}

-(void) starButtonAction2 {
    if (self.importantTask2 == NO) {
        self.importantTask2 = YES;
        [self.starButton2 setBackgroundImage:[UIImage imageNamed:@"patrikStar4.png"] forState:UIControlStateNormal];
        NSLog(@"Became important");
    }else {
        self.importantTask2 = NO;
        [self.starButton2 setBackgroundImage:[UIImage imageNamed:@"patrikStar3.png"] forState:UIControlStateNormal];
        NSLog(@"Became less important");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
