import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:inventory_1/app/utils/helpers.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    required String id,
    required String name,
    String? type,
    required double price,
    @Default(0) double quantity,
    @Default("other") String? unit,
    required double lowOnStock,
    // required String storeId,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
    Timestamp? createdAt,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
    Timestamp? updatedAt,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class ProductDTO with _$ProductDTO {
  factory ProductDTO({
    required String name,
    String? type,
    required double price,
    @Default(0) double quantity,
    @Default("other") String? unit,
    required double lowOnStock,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
    Timestamp? updatedAt,
  }) = _ProductDTO;

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);
}
