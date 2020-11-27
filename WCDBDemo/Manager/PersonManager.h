//
//  PersonManager.h
//  WCDBDemo
//
//  Created by Lindashuai on 2020/11/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class PersonModel;
@interface PersonManager : NSObject

+ (instancetype)data;

#pragma mark - insert
- (BOOL)insertDataToDB:(PersonModel *)model; //插入单个数据

#pragma mark - delete
- (BOOL)deleteDataToDB:(NSInteger)personId; //删除单个数据

#pragma mark - update
- (BOOL)updateNameToDB:(NSString *)name personId:(NSInteger)personId; //更新语音的消息

#pragma mark - get
- (NSArray<PersonModel *> *)getAllData; //获取所有表的数据

@end

NS_ASSUME_NONNULL_END
