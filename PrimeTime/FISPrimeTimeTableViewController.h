//
//  FISPrimeViewController.h
//  PrimeTime
//
//  Created by Zain Nadeem on 6/25/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISPrimeTimeTableViewController : UIViewController <UITableViewDelegate , UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewOfPrimes;
-(NSInteger)primeNumber:(NSInteger)prime;

@end
