///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBSHARINGListFileMembersCountResult.h"
#import "DBSHARINGListFileMembersIndividualResult.h"
#import "DBSHARINGSharingFileAccessError.h"
#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"

#pragma mark - API Object

@implementation DBSHARINGListFileMembersIndividualResult

@synthesize result = _result;
@synthesize accessError = _accessError;

#pragma mark - Constructors

- (instancetype)initWithResult:(DBSHARINGListFileMembersCountResult *)result {
  self = [super init];
  if (self) {
    _tag = DBSHARINGListFileMembersIndividualResultResult;
    _result = result;
  }
  return self;
}

- (instancetype)initWithAccessError:(DBSHARINGSharingFileAccessError *)accessError {
  self = [super init];
  if (self) {
    _tag = DBSHARINGListFileMembersIndividualResultAccessError;
    _accessError = accessError;
  }
  return self;
}

- (instancetype)initWithOther {
  self = [super init];
  if (self) {
    _tag = DBSHARINGListFileMembersIndividualResultOther;
  }
  return self;
}

#pragma mark - Instance field accessors

- (DBSHARINGListFileMembersCountResult *)result {
  if (![self isResult]) {
    [NSException
         raise:@"IllegalStateException"
        format:@"Invalid tag: required DBSHARINGListFileMembersIndividualResultResult, but was %@.", [self tagName]];
  }
  return _result;
}

- (DBSHARINGSharingFileAccessError *)accessError {
  if (![self isAccessError]) {
    [NSException raise:@"IllegalStateException"
                format:@"Invalid tag: required DBSHARINGListFileMembersIndividualResultAccessError, but was %@.",
                       [self tagName]];
  }
  return _accessError;
}

#pragma mark - Tag state methods

- (BOOL)isResult {
  return _tag == DBSHARINGListFileMembersIndividualResultResult;
}

- (BOOL)isAccessError {
  return _tag == DBSHARINGListFileMembersIndividualResultAccessError;
}

- (BOOL)isOther {
  return _tag == DBSHARINGListFileMembersIndividualResultOther;
}

- (NSString *)tagName {
  switch (_tag) {
  case DBSHARINGListFileMembersIndividualResultResult:
    return @"DBSHARINGListFileMembersIndividualResultResult";
  case DBSHARINGListFileMembersIndividualResultAccessError:
    return @"DBSHARINGListFileMembersIndividualResultAccessError";
  case DBSHARINGListFileMembersIndividualResultOther:
    return @"DBSHARINGListFileMembersIndividualResultOther";
  }

  @throw([NSException exceptionWithName:@"InvalidTag" reason:@"Tag has an unknown value." userInfo:nil]);
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBSHARINGListFileMembersIndividualResultSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBSHARINGListFileMembersIndividualResultSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBSHARINGListFileMembersIndividualResultSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBSHARINGListFileMembersIndividualResultSerializer

+ (NSDictionary *)serialize:(DBSHARINGListFileMembersIndividualResult *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  if ([valueObj isResult]) {
    jsonDict[@"result"] = [[DBSHARINGListFileMembersCountResultSerializer serialize:valueObj.result] mutableCopy];
    jsonDict[@".tag"] = @"result";
  } else if ([valueObj isAccessError]) {
    jsonDict[@"access_error"] =
        [[DBSHARINGSharingFileAccessErrorSerializer serialize:valueObj.accessError] mutableCopy];
    jsonDict[@".tag"] = @"access_error";
  } else if ([valueObj isOther]) {
    jsonDict[@".tag"] = @"other";
  } else {
    @throw([NSException exceptionWithName:@"InvalidTag"
                                   reason:@"Object not properly initialized. Tag has an unknown value."
                                 userInfo:nil]);
  }

  return jsonDict;
}

+ (DBSHARINGListFileMembersIndividualResult *)deserialize:(NSDictionary *)valueDict {
  NSString *tag = valueDict[@".tag"];

  if ([tag isEqualToString:@"result"]) {
    DBSHARINGListFileMembersCountResult *result = [DBSHARINGListFileMembersCountResultSerializer deserialize:valueDict];
    return [[DBSHARINGListFileMembersIndividualResult alloc] initWithResult:result];
  } else if ([tag isEqualToString:@"access_error"]) {
    DBSHARINGSharingFileAccessError *accessError =
        [DBSHARINGSharingFileAccessErrorSerializer deserialize:valueDict[@"access_error"]];
    return [[DBSHARINGListFileMembersIndividualResult alloc] initWithAccessError:accessError];
  } else if ([tag isEqualToString:@"other"]) {
    return [[DBSHARINGListFileMembersIndividualResult alloc] initWithOther];
  }

  @throw([NSException
      exceptionWithName:@"InvalidTag"
                 reason:[NSString stringWithFormat:@"Tag has an invalid value: \"%@\".", valueDict[@".tag"]]
               userInfo:nil]);
}

@end
