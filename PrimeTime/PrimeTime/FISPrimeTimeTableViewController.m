//
//  FISPrimeTimeTableViewController.m
//  PrimeTime
//
//  Created by Chris Gonzales on 5/14/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISPrimeTimeTableViewController.h"

@interface FISPrimeTimeTableViewController ()

@property (strong, nonatomic) NSMutableDictionary *primeList;

@end

@implementation FISPrimeTimeTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.accessibilityIdentifier = @"table";
    self.primeList = [[NSMutableDictionary alloc] init];
    
    for (int x=0; x<100; x++) {
        NSString *keyString = [NSString stringWithFormat:@"%i", x];
        NSString *valueString = [NSString stringWithFormat:@"%i", [self primeNumber:x+1]];
        
        [self.primeList setObject:valueString  forKey:keyString];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.primeList.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *keyString = [NSString stringWithFormat:@"%i", indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"primeCell"];
    cell.textLabel.text = self.primeList[keyString];

    return cell;
}

#pragma mark - Helper methods

-(NSInteger)primeNumber:(NSInteger)prime
{
    NSInteger count = 2;
    NSInteger currentNumber = 5;
    
    if (prime == 1) {
        return 2;
    } else if (prime == 2) {
        return 3;
    }
    
    while (count < prime) {
        if (currentNumber%2 != 0) {
            BOOL currentPrime = true;
            for (int x = 3; x < currentNumber; x = x + 2) {
                if (currentNumber%x == 0)
                {
                    currentPrime = false;
                }
            }
            if (currentPrime) {
                count++;
            }
            currentNumber+=2;
        }
    }
    
    return currentNumber-2;
    
}

@end
