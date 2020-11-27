//
//  StudentModel+WCTColumnCoding.mm
//  WCDBDemo
//
//  Created by Lindashuai on 2020/11/27.
//

#import "StudentModel.h"
#import <Foundation/Foundation.h>
#import <WCDB/WCDB.h>

//嵌套模型
@interface StudentModel (WCTColumnCoding) <WCTColumnCoding>
@end

@implementation StudentModel (WCTColumnCoding)

+ (instancetype)unarchiveWithWCTValue:(NSData *)value
{
    return value? [NSKeyedUnarchiver unarchiveObjectWithData:value]:nil;
}

- (NSData *)archivedWCTValue
{
    return [NSKeyedArchiver archivedDataWithRootObject:self];
}

+ (WCTColumnType)columnTypeForWCDB
{
    return WCTColumnTypeBinary;
}

@end
