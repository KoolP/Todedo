//
//  ToDoTableViewCell.h
//  TOdeDO
//
//  Created by Patrik Rikama Hinnenberg on 2018-02-04.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *todoTitle;
@property (weak, nonatomic) IBOutlet UITextView *todoNote;
@property (weak, nonatomic) IBOutlet UIImageView *todoStar;


@end
