// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Store _$$_StoreFromJson(Map<String, dynamic> json) => _$_Store(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      address: json['address'] as String?,
      createdAt: timestampFromJson(json['createdAt']),
      lowOnStock: (json['lowOnStock'] as num).toDouble(),
      updateAt: timestampFromJson(json['updateAt']),
    );

Map<String, dynamic> _$$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'address': instance.address,
      'createdAt': timestampToJson(instance.createdAt),
      'lowOnStock': instance.lowOnStock,
      'updateAt': timestampToJson(instance.updateAt),
    };

_$_StoreDTO _$$_StoreDTOFromJson(Map<String, dynamic> json) => _$_StoreDTO(
      name: json['name'] as String,
      location: json['location'] as String,
      address: json['address'] as String?,
      updatedAt: timestampFromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$_StoreDTOToJson(_$_StoreDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'address': instance.address,
      'updatedAt': timestampToJson(instance.updatedAt),
    };
