// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
// TODO: Created at tiemstamp
  Map<String, BasketItem> get orderDetails =>
      throw _privateConstructorUsedError;
  double get orderQuantity => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {Map<String, BasketItem> orderDetails,
      double orderQuantity,
      double total});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderDetails = null,
    Object? orderQuantity = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      orderDetails: null == orderDetails
          ? _value.orderDetails
          : orderDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, BasketItem>,
      orderQuantity: null == orderQuantity
          ? _value.orderQuantity
          : orderQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderModelCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$_OrderModelCopyWith(
          _$_OrderModel value, $Res Function(_$_OrderModel) then) =
      __$$_OrderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, BasketItem> orderDetails,
      double orderQuantity,
      double total});
}

/// @nodoc
class __$$_OrderModelCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$_OrderModel>
    implements _$$_OrderModelCopyWith<$Res> {
  __$$_OrderModelCopyWithImpl(
      _$_OrderModel _value, $Res Function(_$_OrderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderDetails = null,
    Object? orderQuantity = null,
    Object? total = null,
  }) {
    return _then(_$_OrderModel(
      orderDetails: null == orderDetails
          ? _value._orderDetails
          : orderDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, BasketItem>,
      orderQuantity: null == orderQuantity
          ? _value.orderQuantity
          : orderQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderModel implements _OrderModel {
  _$_OrderModel(
      {required final Map<String, BasketItem> orderDetails,
      required this.orderQuantity,
      required this.total})
      : _orderDetails = orderDetails;

  factory _$_OrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderModelFromJson(json);

// TODO: Created at tiemstamp
  final Map<String, BasketItem> _orderDetails;
// TODO: Created at tiemstamp
  @override
  Map<String, BasketItem> get orderDetails {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_orderDetails);
  }

  @override
  final double orderQuantity;
  @override
  final double total;

  @override
  String toString() {
    return 'OrderModel(orderDetails: $orderDetails, orderQuantity: $orderQuantity, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderModel &&
            const DeepCollectionEquality()
                .equals(other._orderDetails, _orderDetails) &&
            (identical(other.orderQuantity, orderQuantity) ||
                other.orderQuantity == orderQuantity) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_orderDetails), orderQuantity, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      __$$_OrderModelCopyWithImpl<_$_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderModelToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  factory _OrderModel(
      {required final Map<String, BasketItem> orderDetails,
      required final double orderQuantity,
      required final double total}) = _$_OrderModel;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$_OrderModel.fromJson;

  @override // TODO: Created at tiemstamp
  Map<String, BasketItem> get orderDetails;
  @override
  double get orderQuantity;
  @override
  double get total;
  @override
  @JsonKey(ignore: true)
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
