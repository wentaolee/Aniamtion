//
//  MenuController.m
//  Animation
//
//  Created by leewentao on 16/9/10.
//  Copyright © 2016年 leewentao. All rights reserved.
//

#import "MenuController.h"
#import "SWRevealViewController.h"
#import "TTBasicAnimController.h"
#import "TTKeyFrameAnimController.h"
#import "TTTranstionController.h"
#import "TTGrounpAnimController.h"

@interface MenuController ()

@property (nonatomic,strong) NSArray *menuArray;


@end

@implementation MenuController

- (NSArray *)menuArray{
    if (!_menuArray) {
        _menuArray = @[@"基础动画",@"关键帧动画",@"转场动画",@"动画组"];
    }
    return _menuArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

    return self.menuArray.count;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
     cell.textLabel.text = self.menuArray[indexPath.row];
     return cell;
 }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWRevealViewController *revealController = self.revealViewController;
    UIViewController *controller = nil;
    switch (indexPath.row) {
        case 0:
            controller = [[TTBasicAnimController alloc] init];
            break;
        case 1:
            controller = [[TTKeyFrameAnimController alloc] init];
            break;
        case 2:
            controller = [[TTTranstionController alloc] init];
            break;
        case 3:
            controller = [[TTGrounpAnimController alloc] init];
            break;
        default:
            controller = [[TTTranstionController alloc] init];
            break;
    }
    controller.title = self.menuArray[indexPath.row];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    [revealController pushFrontViewController:nav animated:YES];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
