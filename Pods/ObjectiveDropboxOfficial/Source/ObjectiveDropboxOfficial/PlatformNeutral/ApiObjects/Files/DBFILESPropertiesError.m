///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBFILESLookupError.h"
#import "DBFILESPropertiesError.h"
#import "DBPROPERTIESPropertyTemplateError.h"
#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"

#pragma mark - API Object

@implementation DBFILESPropertiesError

@synthesize templateNotFound = _templateNotFound;
@synthesize path = _path;

#pragma mark - Constructors

- (instancetype)initWithTemplateNotFound:(NSString *)templateNotFound {
  self = [super init];
  if (self) {
    _tag = DBFILESPropertiesErrorTemplateNotFound;
    _templateNotFound = templateNotFound;
  }
  return self;
}

- (instancetype)initWithRestrictedContent {
  self = [super init];
  if (self) {
    _tag = DBFILESPropertiesErrorRestrictedContent;
  }
  return self;
}

- (instancetype)initWithOther {
  self = [super init];
  if (self) {
    _tag = DBFILESPropertiesErrorOther;
  }
  return self;
}

- (instancetype)initWithPath:(DBFILESLookupError *)path {
  self = [super init];
  if (self) {
    _tag = DBFILESPropertiesErrorPath;
    _path = path;
  }
  return self;
}

#pragma mark - Instance field accessors

- (NSString *)templateNotFound {
  if (![self isTemplateNotFound]) {
    [NSException raise:@"IllegalStateException"
                format:@"Invalid tag: required DBFILESPropertiesErrorTemplateNotFound, but was %@.", [self tagName]];
  }
  return _templateNotFound;
}

- (DBFILESLookupError *)path {
  if (![self isPath]) {
    [NSException raise:@"IllegalStateException"
                format:@"Invalid tag: required DBFILESPropertiesErrorPath, but was %@.", [self tagName]];
  }
  return _path;
}

#pragma mark - Tag state methods

- (BOOL)isTemplateNotFound {
  return _tag == DBFILESPropertiesErrorTemplateNotFound;
}

- (BOOL)isRestrictedContent {
  return _tag == DBFILESPropertiesErrorRestrictedContent;
}

- (BOOL)isOther {
  return _tag == DBFILESPropertiesErrorOther;
}

- (BOOL)isPath {
  return _tag == DBFILESPropertiesErrorPath;
}

- (NSString *)tagName {
  switch (_tag) {
  case DBFILESPropertiesErrorTemplateNotFound:
    return @"DBFILESPropertiesErrorTemplateNotFound";
  case DBFILESPropertiesErrorRestrictedContent:
    return @"DBFILESPropertiesErrorRestrictedContent";
  case DBFILESPropertiesErrorOther:
    return @"DBFILESPropertiesErrorOther";
  case DBFILESPropertiesErrorPath:
    return @"DBFILESPropertiesErrorPath";
  }

  @throw([NSException exceptionWithName:@"InvalidTag" reason:@"Tag has an unknown value." userInfo:nil]);
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBFILESPropertiesErrorSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBFILESPropertiesErrorSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBFILESPropertiesErrorSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBFILESPropertiesErrorSerializer

+ (NSDictionary *)serialize:(DBFILESPropertiesError *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  if ([valueObj isTemplateNotFound]) {
    jsonDict[@"template_not_found"] = valueObj.templateNotFound;
    jsonDict[@".tag"] = @"template_not_found";
  } else if ([valueObj isRestrictedContent]) {
    jsonDict[@".tag"] = @"restricted_content";
  } else if ([valueObj isOther]) {
    jsonDict[@".tag"] = @"other";
  } else if ([valueObj isPath]) {
    jsonDict[@"path"] = [[DBFILESLookupErrorSerializer serialize:valueObj.path] mutableCopy];
    jsonDict[@".tag"] = @"path";
  } else {
    @throw([NSException exceptionWithName:@"InvalidTag"
                                   reason:@"Object not properly initialized. Tag has an unknown value."
                                 userInfo:nil]);
  }

  return jsonDict;
}

+ (DBFILESPropertiesError *)deserialize:(NSDictionary *)valueDict {
  NSString *tag = valueDict[@".tag"];

  if ([tag isEqualToString:@"template_not_found"]) {
    NSString *templateNotFound = valueDict[@"template_not_found"];
    return [[DBFILESPropertiesError alloc] initWithTemplateNotFound:templateNotFound];
  } else if ([tag isEqualToString:@"restricted_content"]) {
    return [[DBFILESPropertiesError alloc] initWithRestrictedContent];
  } else if ([tag isEqualToString:@"other"]) {
    return [[DBFILESPropertiesError alloc] initWithOther];
  } else if ([tag isEqualToString:@"path"]) {
    DBFILESLookupError *path = [DBFILESLookupErrorSerializer deserialize:valueDict[@"path"]];
    return [[DBFILESPropertiesError alloc] initWithPath:path];
  }

  @throw([NSException
      exceptionWithName:@"InvalidTag"
                 reason:[NSString stringWithFormat:@"Tag has an invalid value: \"%@\".", valueDict[@".tag"]]
               userInfo:nil]);
}

@end
