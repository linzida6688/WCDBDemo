//
//  PersonModel.mm
//  WCDBDemo
//
//  Created by Lindashuai on 2020/11/27.
//

#import "PersonModel+WCTTableCoding.h"
#import "PersonModel.h"
#import <WCDB/WCDB.h>

//嵌套模型
#import <MJExtension/MJExtension.h>
#import "StudentModel.h" //嵌套模型

@implementation PersonModel

+ (NSDictionary *)mj_objectClassInArray { //嵌套模型
    return @{
             @"StudentModel":@"studentModel",
             };
}

WCDB_IMPLEMENTATION(PersonModel)
WCDB_SYNTHESIZE_COLUMN(PersonModel, personId, "id") //主键
WCDB_SYNTHESIZE_COLUMN(PersonModel, name, "name")
WCDB_SYNTHESIZE_COLUMN(PersonModel, age, "age")

WCDB_SYNTHESIZE_COLUMN(PersonModel, studentModel, "studentModel")

//Not null
WCDB_NOT_NULL(PersonModel, personId) //设置这个字段非空

WCDB_PRIMARY_AUTO_INCREMENT(PersonModel, personId) //自动递增主键

- (instancetype)init {
    if (self = [super init]) {
        self.isAutoIncrement = YES; //开启自增
    }
    return self;
}
  
@end
