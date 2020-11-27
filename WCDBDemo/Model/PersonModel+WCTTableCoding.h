//
//  PersonModel+WCTTableCoding.h
//  WCDBDemo
//
//  Created by Lindashuai on 2020/11/27.
//

#import "PersonModel.h"
#import <WCDB/WCDB.h>

@interface PersonModel (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(personId) //主键
WCDB_PROPERTY(name)
WCDB_PROPERTY(age)

@end
