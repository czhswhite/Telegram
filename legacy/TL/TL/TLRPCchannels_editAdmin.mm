#import "TLRPCchannels_editAdmin.h"

#import "../NSInputStream+TL.h"
#import "../NSOutputStream+TL.h"

#import "TLInputChannel.h"
#import "TLInputUser.h"
#import "TLChannelAdminRights.h"
#import "TLUpdates.h"

@implementation TLRPCchannels_editAdmin


- (Class)responseClass
{
    return [TLUpdates class];
}

- (int)impliedResponseSignature
{
    return 0;
}

- (int)layerVersion
{
    return 68;
}

- (int32_t)TLconstructorSignature
{
    TGLog(@"constructorSignature is not implemented for base type");
    return 0;
}

- (int32_t)TLconstructorName
{
    TGLog(@"constructorName is not implemented for base type");
    return 0;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::shared_ptr<TLMetaObject>)__unused metaObject
{
    TGLog(@"TLbuildFromMetaObject is not implemented for base type");
    return nil;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)__unused values
{
    TGLog(@"TLfillFieldsWithValues is not implemented for base type");
}


@end

@implementation TLRPCchannels_editAdmin$channels_editAdmin : TLRPCchannels_editAdmin


- (int32_t)TLconstructorSignature
{
    return (int32_t)0x20b88214;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0xcdb8de75;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::shared_ptr<TLMetaObject>)metaObject
{
    TLRPCchannels_editAdmin$channels_editAdmin *object = [[TLRPCchannels_editAdmin$channels_editAdmin alloc] init];
    object.channel = metaObject->getObject((int32_t)0xe11f3d41);
    object.user_id = metaObject->getObject((int32_t)0xafdf4073);
    object.admin_rights = metaObject->getObject((int32_t)0x86c3114f);
    return object;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)values
{
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeObject;
        value.nativeObject = self.channel;
        values->insert(std::pair<int32_t, TLConstructedValue>((int32_t)0xe11f3d41, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeObject;
        value.nativeObject = self.user_id;
        values->insert(std::pair<int32_t, TLConstructedValue>((int32_t)0xafdf4073, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeObject;
        value.nativeObject = self.admin_rights;
        values->insert(std::pair<int32_t, TLConstructedValue>((int32_t)0x86c3114f, value));
    }
}


@end

