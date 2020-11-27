//
//  StudentModel.mm
//  WCDBDemo
//
//  Created by Lindashuai on 2020/11/27.
//

#import "StudentModel+WCTTableCoding.h"
#import "StudentModel.h"
#import <WCDB/WCDB.h>
#import <MJExtension/MJExtension.h>

@implementation StudentModel
MJExtensionCodingImplementation

WCDB_IMPLEMENTATION(StudentModel)
WCDB_SYNTHESIZE(StudentModel, studentId)
WCDB_SYNTHESIZE(StudentModel, sex)

WCDB_PRIMARY_AUTO_INCREMENT(StudentModel, studentId) //自动递增主键

- (instancetype)init {
    if(self = [super init]) {
        self.isAutoIncrement = YES;
    }
    return self;
}
  
@end
