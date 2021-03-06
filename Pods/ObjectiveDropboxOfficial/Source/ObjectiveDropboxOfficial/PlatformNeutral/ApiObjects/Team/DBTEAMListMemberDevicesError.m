///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"
#import "DBTEAMListMemberDevicesError.h"

#pragma mark - API Object

@implementation DBTEAMListMemberDevicesError

#pragma mark - Constructors

- (instancetype)initWithMemberNotFound {
  self = [super init];
  if (self) {
    _tag = DBTEAMListMemberDevicesErrorMemberNotFound;
  }
  return self;
}

- (instancetype)initWithOther {
  self = [super init];
  if (self) {
    _tag = DBTEAMListMemberDevicesErrorOther;
  }
  return self;
}

#pragma mark - Instance field accessors

#pragma mark - Tag state methods

- (BOOL)isMemberNotFound {
  return _tag == DBTEAMListMemberDevicesErrorMemberNotFound;
}

- (BOOL)isOther {
  return _tag == DBTEAMListMemberDevicesErrorOther;
}

- (NSString *)tagName {
  switch (_tag) {
  case DBTEAMListMemberDevicesErrorMemberNotFound:
    return @"DBTEAMListMemberDevicesErrorMemberNotFound";
  case DBTEAMListMemberDevicesErrorOther:
    return @"DBTEAMListMemberDevicesErrorOther";
  }

  @throw([NSException exceptionWithName:@"InvalidTag" reason:@"Tag has an unknown value." userInfo:nil]);
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBTEAMListMemberDevicesErrorSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBTEAMListMemberDevicesErrorSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBTEAMListMemberDevicesErrorSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBTEAMListMemberDevicesErrorSerializer

+ (NSDictionary *)serialize:(DBTEAMListMemberDevicesError *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  if ([valueObj isMemberNotFound]) {
    jsonDict[@".tag"] = @"member_not_found";
  } else if ([valueObj isOther]) {
    jsonDict[@".tag"] = @"other";
  } else {
    @throw([NSException exceptionWithName:@"InvalidTag"
                                   reason:@"Object not properly initialized. Tag has an unknown value."
                                 userInfo:nil]);
  }

  return jsonDict;
}

+ (DBTEAMListMemberDevicesError *)deserialize:(NSDictionary *)valueDict {
  NSString *tag = valueDict[@".tag"];

  if ([tag isEqualToString:@"member_not_found"]) {
    return [[DBTEAMListMemberDevicesError alloc] initWithMemberNotFound];
  } else if ([tag isEqualToString:@"other"]) {
    return [[DBTEAMListMemberDevicesError alloc] initWithOther];
  }

  @throw([NSException
      exceptionWithName:@"InvalidTag"
                 reason:[NSString stringWithFormat:@"Tag has an invalid value: \"%@\".", valueDict[@".tag"]]
               userInfo:nil]);
}

@end
