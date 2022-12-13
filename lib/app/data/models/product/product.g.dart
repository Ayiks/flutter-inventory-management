// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String?,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
      unit: json['unit'] as String? ?? "other",
      createdAt: timestampFromJson(json['createdAt']),
      lowOnStock: (json['lowOnStock'] as num).toDouble(),
      updateAt: timestampFromJson(json['updateAt']),
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'price': instance.price,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'createdAt': timestampToJson(instance.createdAt),
      'lowOnStock': instance.lowOnStock,
      'updateAt': timestampToJson(instance.updateAt),
    };

_$_ProductDTO _$$_ProductDTOFromJson(Map<String, dynamic> json) =>
    _$_ProductDTO(
      name: json['name'] as String,
      type: json['type'] as String?,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
      unit: json['unit'] as String? ?? "other",
      lowOnStock: (json['lowOnStock'] as num).toDouble(),
      updatedAt: timestampFromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$_ProductDTOToJson(_$_ProductDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'price': instance.price,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'lowOnStock': instance.lowOnStock,
      'updatedAt': timestampToJson(instance.updatedAt),
    };
