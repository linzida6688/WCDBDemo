//
//  PersonModel.h
//  WCDBDemo
//
//  Created by Lindashuai on 2020/11/27.
//

#import <Foundation/Foundation.h>

@class StudentModel;
@interface PersonModel : NSObject

@property(nonatomic, assign) NSInteger personId; //主键
@property(nonatomic, strong) NSString *name;
@property(nonatomic, assign) NSInteger age;

@property(nonatomic, strong) StudentModel *studentModel;

@end
