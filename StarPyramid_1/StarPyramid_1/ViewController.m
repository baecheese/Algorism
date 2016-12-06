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

/*
 
 문제 출처
 https://www.acmicpc.net/problem/2438
 
 문제
 첫째 줄에는 별 1개, 둘째 줄에는 별 2개, N번째 줄에는 별 N개를 찍는 문제
 
 입력
 첫째 줄에 N (1<=N<=100)이 주어진다.
 
 출력
 첫째 줄부터 N번째 줄 까지 차례대로 별을 출력한다.
 
 예제 입력  복사
 5
 
 예제 출력  복사
 *
 **
 ***
 ****
 *****
 
 
 */

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)clickButton:(UIButton *)sender {
    NSInteger floorNumberTotal = [textField.text integerValue];
    
    if (pyrmidTypeSegment.selectedSegmentIndex == 0) {
        [self creatPyramid:floorNumberTotal];
    }
    else {
        NSLog(@"ing");
    }
    
    
}

- (void)creatPyramid:(NSInteger) floorNumberTotal{
    
    for (NSInteger nowFloor = 1; nowFloor <= floorNumberTotal; nowFloor++) {
        for (NSInteger star = 1; star <= nowFloor; star++) {
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
