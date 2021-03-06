///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBFILESFileMetadata;
@class DBFILESListRevisionsResult;

#pragma mark - API Object

///
/// The `ListRevisionsResult` struct.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBFILESListRevisionsResult : NSObject <DBSerializable>

#pragma mark - Instance fields

/// If the file is deleted.
@property (nonatomic, readonly) NSNumber * _Nonnull isDeleted;

/// The revisions for the file. Only non-delete revisions will show up here.
@property (nonatomic, readonly) NSArray<DBFILESFileMetadata *> * _Nonnull entries;

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @param isDeleted If the file is deleted.
/// @param entries The revisions for the file. Only non-delete revisions will
/// show up here.
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithIsDeleted:(NSNumber * _Nonnull)isDeleted
                                  entries:(NSArray<DBFILESFileMetadata *> * _Nonnull)entries;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `ListRevisionsResult` struct.
///
@interface DBFILESListRevisionsResultSerializer : NSObject

///
/// Serializes `DBFILESListRevisionsResult` instances.
///
/// @param instance An instance of the `DBFILESListRevisionsResult` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBFILESListRevisionsResult` API object.
///
+ (NSDictionary * _Nonnull)serialize:(DBFILESListRevisionsResult * _Nonnull)instance;

///
/// Deserializes `DBFILESListRevisionsResult` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBFILESListRevisionsResult` API object.
///
/// @return An instantiation of the `DBFILESListRevisionsResult` object.
///
+ (DBFILESListRevisionsResult * _Nonnull)deserialize:(NSDictionary * _Nonnull)dict;

@end
