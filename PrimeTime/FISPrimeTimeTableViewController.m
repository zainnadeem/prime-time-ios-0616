//
//  FISPrimeViewController.m
//  PrimeTime
//
//  Created by Zain Nadeem on 6/25/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPrimeTimeTableViewController.h"

@interface FISPrimeTimeTableViewController ()
@property (strong, nonatomic) NSMutableDictionary *dictionaryOfPrimes;
@end

@implementation FISPrimeTimeTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableViewOfPrimes.accessibilityIdentifier = @"table";
    
    self.dictionaryOfPrimes = [[NSMutableDictionary alloc]init];
    
    for (NSUInteger x = 0; x < 100;x++){
        NSString *primeKey = [NSString stringWithFormat:@"%lu", x];
        NSString *primeNumberValue = [NSString stringWithFormat:@"%lu", [self primeNumber:x+1]];
        [self.dictionaryOfPrimes setObject:primeNumberValue forKey:primeKey];
    }
    NSLog(@"%@", self.dictionaryOfPrimes);
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//5 should output 11   2,3,5,7,11
-(NSInteger)primeNumber:(NSInteger)prime
{
    NSInteger count = 2; // count is 2
    NSInteger currentNumber = 5; // current number is 5
    
    if (prime == 1) {
        return 2; //returns two if you as for the first prime number
    } else if (prime == 2) {
        return 3; // returns three if you ask for the second prime number
    }
    
    while (count < prime) { // for as long as count is less than the prime number
        if (currentNumber%2 != 0) { // if current number / 2 is not equal to 0
            BOOL currentPrime = true; //current prime = number is prime
            
            for (int x = 3; x < currentNumber; x = x + 2) { // integer starts with 3; goes until the x is less than the current number --- right now currentnumber is 5; x is 3, increment x+2.
                
                
                if (currentNumber%x == 0) // 5/3 != 0
                {
                    currentPrime = false; // this is false
                }
            }
            
            if (currentPrime) {//if current prime | add one to count
                count++;
            }
            currentNumber+=2; //add two to current number at the end of if statement
        }
    }
    
    return currentNumber-2;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *keyString = [NSString stringWithFormat:@"%lu", indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellWithPrime"];
    cell.textLabel.text = self.dictionaryOfPrimes[keyString];
    
    return cell;

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dictionaryOfPrimes.count;
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
