///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"
#import "DBTEAMRevokeDeviceSessionBatchError.h"

#pragma mark - API Object

@implementation DBTEAMRevokeDeviceSessionBatchError

#pragma mark - Constructors

- (instancetype)initWithOther {
  self = [super init];
  if (self) {
    _tag = DBTEAMRevokeDeviceSessionBatchErrorOther;
  }
  return self;
}

#pragma mark - Instance field accessors

#pragma mark - Tag state methods

- (BOOL)isOther {
  return _tag == DBTEAMRevokeDeviceSessionBatchErrorOther;
}

- (NSString *)tagName {
  switch (_tag) {
  case DBTEAMRevokeDeviceSessionBatchErrorOther:
    return @"DBTEAMRevokeDeviceSessionBatchErrorOther";
  }

  @throw([NSException exceptionWithName:@"InvalidTag" reason:@"Tag has an unknown value." userInfo:nil]);
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBTEAMRevokeDeviceSessionBatchErrorSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBTEAMRevokeDeviceSessionBatchErrorSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBTEAMRevokeDeviceSessionBatchErrorSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBTEAMRevokeDeviceSessionBatchErrorSerializer

+ (NSDictionary *)serialize:(DBTEAMRevokeDeviceSessionBatchError *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  if ([valueObj isOther]) {
    jsonDict[@".tag"] = @"other";
  } else {
    @throw([NSException exceptionWithName:@"InvalidTag"
                                   reason:@"Object not properly initialized. Tag has an unknown value."
                                 userInfo:nil]);
  }

  return jsonDict;
}

+ (DBTEAMRevokeDeviceSessionBatchError *)deserialize:(NSDictionary *)valueDict {
  NSString *tag = valueDict[@".tag"];

  if ([tag isEqualToString:@"other"]) {
    return [[DBTEAMRevokeDeviceSessionBatchError alloc] initWithOther];
  }

  @throw([NSException
      exceptionWithName:@"InvalidTag"
                 reason:[NSString stringWithFormat:@"Tag has an invalid value: \"%@\".", valueDict[@".tag"]]
               userInfo:nil]);
}

@end
