//
//  StudentModel+WCTTableCoding.h
//  WCDBDemo
//
//  Created by Lindashuai on 2020/11/27.
//

#import "StudentModel.h"
#import <WCDB/WCDB.h>

@interface StudentModel (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(studentId)
WCDB_PROPERTY(sex)

@end
