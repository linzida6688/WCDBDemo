//
//  ViewController.m
//  WCDBDemo
//
//  Created by Lindashuai on 2020/11/27.
//

#import "ViewController.h"
#import "PersonManager.h"
#import "PersonModel.h"
#import "StudentModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PersonModel *model = [[PersonModel alloc]init];
    model.name = @"小张";
    model.studentModel = [[StudentModel alloc]init];
    model.studentModel.sex = @"nan";
    [[PersonManager data] insertDataToDB:model];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray<PersonModel *> *arr = [[PersonManager data] getAllData];
    NSLog(@"alldata %@", arr);
}

@end
