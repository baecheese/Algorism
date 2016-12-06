//
//  ViewController.m
//  StarPyramid_1
//
//  Created by 배지영 on 2016. 12. 6..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
    IBOutlet UITextField *textField;
    IBOutlet UISegmentedControl *pyrmidTypeSegment;
    
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)clickButton:(UIButton *)sender {
    NSInteger floorNumberTotal = [textField.text integerValue];
    // type 1
    if (pyrmidTypeSegment.selectedSegmentIndex == 0) {
        [self creatPyramidFristType:floorNumberTotal];
    }
    // type 2
    else {
        [self creatPyramidSecondType:floorNumberTotal];
    }
    
}


   /****************/
  /*    type 1    */
 /****************/

/*
 
 완성 모양
 
 *
 **
 ***
 ****
 *****
 
 */


- (void)creatPyramidFristType:(NSInteger) floorNumberTotal{
    
    for (NSInteger nowFloor = 1; nowFloor <= floorNumberTotal; nowFloor++) {
        for (NSInteger star = 1; star <= nowFloor; star++) {
            printf("*");
        }
        printf("\n");
    }
}


    /****************/
   /*    type 2    */
  /****************/

/*
 
 완성모양

   *
  ***
 *****
*******
 
temp - star - floor
     3 - 1 - 1
     2 - 3 - 2
     1 - 5 - 3
     0 - 7 - 4
 
 */

- (void)creatPyramidSecondType:(NSInteger) floorNumberTotal{
    
    for (NSInteger nowFloor = 1; nowFloor <= floorNumberTotal; nowFloor++) {
        
        for (NSInteger temp = 0; temp <= floorNumberTotal-nowFloor; temp++) {
            printf("o");
        }
        for (NSInteger star = 1; star <= (nowFloor*2-1); star++) {
            printf("*");
        }
        printf("\n");
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
