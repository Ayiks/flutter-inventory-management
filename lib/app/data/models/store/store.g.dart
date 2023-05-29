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
      updatedAt: timestampFromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'address': instance.address,
      'createdAt': timestampToJson(instance.createdAt),
      'updatedAt': timestampToJson(instance.updatedAt),
    };

_$_StoreDTO _$$_StoreDTOFromJson(Map<String, dynamic> json) => _$_StoreDTO(
      name: json['name'] as String,
      location: json['location'] as String,
      address: json['address'] as String?,
      createdAt: timestampFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_StoreDTOToJson(_$_StoreDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'address': instance.address,
      'createdAt': timestampToJson(instance.createdAt),
    };
