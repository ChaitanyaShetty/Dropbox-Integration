///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBFILESPropertyGroupWithPath.h"
#import "DBPROPERTIESPropertyGroup.h"
#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"

#pragma mark - API Object

@implementation DBFILESPropertyGroupWithPath

#pragma mark - Constructors

- (instancetype)initWithPath:(NSString *)path propertyGroups:(NSArray<DBPROPERTIESPropertyGroup *> *)propertyGroups {
  [DBStoneValidators stringValidator:nil maxLength:nil pattern:@"/(.|[\\r\\n])*|id:.*|(ns:[0-9]+(/.*)?)"](path);
  [DBStoneValidators arrayValidator:nil maxItems:nil itemValidator:nil](propertyGroups);

  self = [super init];
  if (self) {
    _path = path;
    _propertyGroups = propertyGroups;
  }
  return self;
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBFILESPropertyGroupWithPathSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBFILESPropertyGroupWithPathSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBFILESPropertyGroupWithPathSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBFILESPropertyGroupWithPathSerializer

+ (NSDictionary *)serialize:(DBFILESPropertyGroupWithPath *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  jsonDict[@"path"] = valueObj.path;
  jsonDict[@"property_groups"] = [DBArraySerializer serialize:valueObj.propertyGroups
                                                    withBlock:^id(id elem) {
                                                      return [DBPROPERTIESPropertyGroupSerializer serialize:elem];
                                                    }];

  return jsonDict;
}

+ (DBFILESPropertyGroupWithPath *)deserialize:(NSDictionary *)valueDict {
  NSString *path = valueDict[@"path"];
  NSArray<DBPROPERTIESPropertyGroup *> *propertyGroups =
      [DBArraySerializer deserialize:valueDict[@"property_groups"]
                           withBlock:^id(id elem) {
                             return [DBPROPERTIESPropertyGroupSerializer deserialize:elem];
                           }];

  return [[DBFILESPropertyGroupWithPath alloc] initWithPath:path propertyGroups:propertyGroups];
}

@end
