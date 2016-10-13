//
//  MJTop10ViewController.m
//  Floral
//
//  Created by 孙梦翔 on 16/10/13.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJTop10ViewController.h"
#import "MJTOP10Cell.h"
#import "MJNetTools.h"
#import "MJTOP10Detail.h"
@interface MJTop10ViewController ()
@property (nonatomic,strong) NSArray * top10Array;
@end

@implementation MJTop10ViewController

static NSString * cellID = @"TOP10DetailCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"本周排行TOP10";
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.rowHeight = 80.0f;
    [self.tableView registerNib:[UINib nibWithNibName:@"MJTOP10Cell" bundle:nil] forCellReuseIdentifier:cellID];
    [self loadData];
}

#pragma mark - loadData
- (void)loadData
{
    [MJNetTools requestCommunityTOP10:^(id responseObject) {
        
        NSArray * array = responseObject[@"result"];
        NSMutableArray * arrM = [NSMutableArray array];
        for (NSDictionary * dict in array) {
            MJTOP10Detail * top10 = [[MJTOP10Detail alloc] initWithDict:dict];
            [arrM addObject:top10];
        }
        self.top10Array = arrM;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.top10Array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MJTOP10Cell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.detail = self.top10Array[indexPath.item];
    cell.order = indexPath.item + 1;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
