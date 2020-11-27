//
//  PersonManager.m
//  WCDBDemo
//
//  Created by Lindashuai on 2020/11/27.
//

#import "PersonManager.h"
#import "PersonModel+WCTTableCoding.h"
#import "PersonModel.h"
#import <WCDB/WCDB.h>

static PersonManager *kPersonManager = nil;
static NSString *const kPersonDBName = @"Person.sqlite";//消息列表的数据库名称
static NSString *const kPersonTableName = @"PersonTable";//消息列表的表名称
@interface PersonManager ()

@property(nonatomic, strong) WCTDatabase *database;

@end

@implementation PersonManager

static dispatch_once_t onceToken;
+ (instancetype)data {
    dispatch_once(&onceToken, ^{
        kPersonManager = [[self alloc] init];
    });
    return kPersonManager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kPersonManager = [super allocWithZone:zone];
    });
    return kPersonManager;
}

- (id)copyWithZone:(NSZone *)zone {
    return kPersonManager;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return kPersonManager;
}

- (instancetype)init {
    if(self = [super init]) {
        [self database];
    }
    return self;
}

- (WCTDatabase *)database {
    if(_database == nil) {
        //注意，此处数据库名字不要带sqlite的后缀名
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docDir = [paths objectAtIndex:0];
        NSString *path = [docDir stringByAppendingPathComponent:kPersonDBName];
        _database = [[WCTDatabase alloc] initWithPath:path];
        BOOL result = [_database createTableAndIndexesOfName:kPersonTableName withClass:[PersonModel class]];
        if (result) {
            return _database;
        }
    }
    return _database;
}

#pragma mark - insert

- (BOOL)insertDataToDB:(PersonModel *)model { //插入单个数据
    BOOL result = [self.database insertObject:model into:kPersonTableName];
    model.personId = (NSInteger)model.personId;
    return result;
}

#pragma mark - delete

- (BOOL)deleteDataToDB:(NSInteger)personId { //删除单个数据
    BOOL result = [self.database deleteObjectsFromTable:kPersonTableName where:PersonModel.personId == personId];
    return result;
}

#pragma mark - update

- (BOOL)updateNameToDB:(NSString *)name personId:(NSInteger)personId { //更新语音的消息
    PersonModel *model = [[PersonModel alloc] init];
    model.name = name;
    BOOL result = [self.database updateRowsInTable:kPersonTableName onProperties:PersonModel.name withObject:model where:model.personId == personId];
    return result;
}

#pragma mark - get

- (NSArray<PersonModel *> *)getAllData { //获取所有表的数据
    return [self.database getAllObjectsOfClass:[PersonModel class] fromTable:kPersonTableName];
}

@end
