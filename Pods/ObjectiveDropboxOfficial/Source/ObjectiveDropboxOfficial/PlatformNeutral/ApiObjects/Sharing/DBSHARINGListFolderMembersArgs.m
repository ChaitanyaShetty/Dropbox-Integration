///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBSHARINGListFolderMembersArgs.h"
#import "DBSHARINGListFolderMembersCursorArg.h"
#import "DBSHARINGMemberAction.h"
#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"

#pragma mark - API Object

@implementation DBSHARINGListFolderMembersArgs

#pragma mark - Constructors

- (instancetype)initWithSharedFolderId:(NSString *)sharedFolderId
                               actions:(NSArray<DBSHARINGMemberAction *> *)actions
                                 limit:(NSNumber *)limit {
  [DBStoneValidators stringValidator:nil maxLength:nil pattern:@"[-_0-9a-zA-Z:]+"](sharedFolderId);
  [DBStoneValidators nullableValidator:[DBStoneValidators arrayValidator:nil maxItems:nil itemValidator:nil]](actions);
  [DBStoneValidators numericValidator:@(1) maxValue:@(1000)](limit ?: @(1000));

  self = [super initWithActions:actions limit:limit];
  if (self) {
    _sharedFolderId = sharedFolderId;
  }
  return self;
}

- (instancetype)initWithSharedFolderId:(NSString *)sharedFolderId {
  return [self initWithSharedFolderId:sharedFolderId actions:nil limit:nil];
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBSHARINGListFolderMembersArgsSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBSHARINGListFolderMembersArgsSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBSHARINGListFolderMembersArgsSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBSHARINGListFolderMembersArgsSerializer

+ (NSDictionary *)serialize:(DBSHARINGListFolderMembersArgs *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  jsonDict[@"shared_folder_id"] = valueObj.sharedFolderId;
  if (valueObj.actions) {
    jsonDict[@"actions"] = [DBArraySerializer serialize:valueObj.actions
                                              withBlock:^id(id elem) {
                                                return [DBSHARINGMemberActionSerializer serialize:elem];
                                              }];
  }
  jsonDict[@"limit"] = valueObj.limit;

  return jsonDict;
}

+ (DBSHARINGListFolderMembersArgs *)deserialize:(NSDictionary *)valueDict {
  NSString *sharedFolderId = valueDict[@"shared_folder_id"];
  NSArray<DBSHARINGMemberAction *> *actions =
      valueDict[@"actions"] ? [DBArraySerializer deserialize:valueDict[@"actions"]
                                                   withBlock:^id(id elem) {
                                                     return [DBSHARINGMemberActionSerializer deserialize:elem];
                                                   }]
                            : nil;
  NSNumber *limit = valueDict[@"limit"] ?: @(1000);

  return [[DBSHARINGListFolderMembersArgs alloc] initWithSharedFolderId:sharedFolderId actions:actions limit:limit];
}

@end
