// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String get id => throw _privateConstructorUsedError;
  Map<String, BasketItem> get orderDetails =>
      throw _privateConstructorUsedError;
  double get orderQuantity => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {String id,
      Map<String, BasketItem> orderDetails,
      double orderQuantity,
      double total,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
          Timestamp? createdAt});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderDetails = null,
    Object? orderQuantity = null,
    Object? total = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Map<String, BasketItem> orderDetails,
      double orderQuantity,
      double total,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
          Timestamp? createdAt});
}

/// @nodoc
class __$$_OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res, _$_Order>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderDetails = null,
    Object? orderQuantity = null,
    Object? total = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$_Order(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Order implements _Order {
  _$_Order(
      {required this.id,
      required final Map<String, BasketItem> orderDetails,
      required this.orderQuantity,
      required this.total,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
          this.createdAt})
      : _orderDetails = orderDetails;

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  final String id;
  final Map<String, BasketItem> _orderDetails;
  @override
  Map<String, BasketItem> get orderDetails {
    if (_orderDetails is EqualUnmodifiableMapView) return _orderDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_orderDetails);
  }

  @override
  final double orderQuantity;
  @override
  final double total;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  final Timestamp? createdAt;

  @override
  String toString() {
    return 'Order(id: $id, orderDetails: $orderDetails, orderQuantity: $orderQuantity, total: $total, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._orderDetails, _orderDetails) &&
            (identical(other.orderQuantity, orderQuantity) ||
                other.orderQuantity == orderQuantity) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_orderDetails),
      orderQuantity,
      total,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  factory _Order(
      {required final String id,
      required final Map<String, BasketItem> orderDetails,
      required final double orderQuantity,
      required final double total,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
          final Timestamp? createdAt}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  String get id;
  @override
  Map<String, BasketItem> get orderDetails;
  @override
  double get orderQuantity;
  @override
  double get total;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderDTO _$OrderDTOFromJson(Map<String, dynamic> json) {
  return _OrderDTO.fromJson(json);
}

/// @nodoc
mixin _$OrderDTO {
  Map<String, BasketItem> get orderDetails =>
      throw _privateConstructorUsedError;
  double get orderQuantity => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDTOCopyWith<OrderDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDTOCopyWith<$Res> {
  factory $OrderDTOCopyWith(OrderDTO value, $Res Function(OrderDTO) then) =
      _$OrderDTOCopyWithImpl<$Res, OrderDTO>;
  @useResult
  $Res call(
      {Map<String, BasketItem> orderDetails,
      double orderQuantity,
      double total,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
          Timestamp? createdAt});
}

/// @nodoc
class _$OrderDTOCopyWithImpl<$Res, $Val extends OrderDTO>
    implements $OrderDTOCopyWith<$Res> {
  _$OrderDTOCopyWithImpl(this._value, this._then);

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
    Object? createdAt = freezed,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderDTOCopyWith<$Res> implements $OrderDTOCopyWith<$Res> {
  factory _$$_OrderDTOCopyWith(
          _$_OrderDTO value, $Res Function(_$_OrderDTO) then) =
      __$$_OrderDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, BasketItem> orderDetails,
      double orderQuantity,
      double total,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
          Timestamp? createdAt});
}

/// @nodoc
class __$$_OrderDTOCopyWithImpl<$Res>
    extends _$OrderDTOCopyWithImpl<$Res, _$_OrderDTO>
    implements _$$_OrderDTOCopyWith<$Res> {
  __$$_OrderDTOCopyWithImpl(
      _$_OrderDTO _value, $Res Function(_$_OrderDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderDetails = null,
    Object? orderQuantity = null,
    Object? total = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$_OrderDTO(
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderDTO implements _OrderDTO {
  _$_OrderDTO(
      {required final Map<String, BasketItem> orderDetails,
      required this.orderQuantity,
      required this.total,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
          this.createdAt})
      : _orderDetails = orderDetails;

  factory _$_OrderDTO.fromJson(Map<String, dynamic> json) =>
      _$$_OrderDTOFromJson(json);

  final Map<String, BasketItem> _orderDetails;
  @override
  Map<String, BasketItem> get orderDetails {
    if (_orderDetails is EqualUnmodifiableMapView) return _orderDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_orderDetails);
  }

  @override
  final double orderQuantity;
  @override
  final double total;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  final Timestamp? createdAt;

  @override
  String toString() {
    return 'OrderDTO(orderDetails: $orderDetails, orderQuantity: $orderQuantity, total: $total, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDTO &&
            const DeepCollectionEquality()
                .equals(other._orderDetails, _orderDetails) &&
            (identical(other.orderQuantity, orderQuantity) ||
                other.orderQuantity == orderQuantity) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_orderDetails),
      orderQuantity,
      total,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderDTOCopyWith<_$_OrderDTO> get copyWith =>
      __$$_OrderDTOCopyWithImpl<_$_OrderDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderDTOToJson(
      this,
    );
  }
}

abstract class _OrderDTO implements OrderDTO {
  factory _OrderDTO(
      {required final Map<String, BasketItem> orderDetails,
      required final double orderQuantity,
      required final double total,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
          final Timestamp? createdAt}) = _$_OrderDTO;

  factory _OrderDTO.fromJson(Map<String, dynamic> json) = _$_OrderDTO.fromJson;

  @override
  Map<String, BasketItem> get orderDetails;
  @override
  double get orderQuantity;
  @override
  double get total;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDTOCopyWith<_$_OrderDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
