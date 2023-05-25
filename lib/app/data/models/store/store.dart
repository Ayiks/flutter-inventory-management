import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_1/app/utils/helpers.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
class Store with _$Store {
  factory Store({
    required String id,
    required String name,
    required String location,
    String? address,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
    Timestamp? createdAt,
    required double lowOnStock,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
    Timestamp? updateAt,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}

@freezed
class StoreDTO with _$StoreDTO {
  factory StoreDTO({
    required String name,
    required String location,
    String? address,
    @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
    Timestamp? updatedAt,
  }) = _StoreDTO;

  factory StoreDTO.fromJson(Map<String, dynamic> json) =>
      _$StoreDTOFromJson(json);
}
