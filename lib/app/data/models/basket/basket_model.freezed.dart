// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BasketItem _$BasketItemFromJson(Map<String, dynamic> json) {
  return _BasketItem.fromJson(json);
}

/// @nodoc
mixin _$BasketItem {
  Product get product => throw _privateConstructorUsedError;
  set product(Product value) => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  set quantity(double value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasketItemCopyWith<BasketItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasketItemCopyWith<$Res> {
  factory $BasketItemCopyWith(
          BasketItem value, $Res Function(BasketItem) then) =
      _$BasketItemCopyWithImpl<$Res, BasketItem>;
  @useResult
  $Res call({Product product, double quantity});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$BasketItemCopyWithImpl<$Res, $Val extends BasketItem>
    implements $BasketItemCopyWith<$Res> {
  _$BasketItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BasketItemCopyWith<$Res>
    implements $BasketItemCopyWith<$Res> {
  factory _$$_BasketItemCopyWith(
          _$_BasketItem value, $Res Function(_$_BasketItem) then) =
      __$$_BasketItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Product product, double quantity});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$_BasketItemCopyWithImpl<$Res>
    extends _$BasketItemCopyWithImpl<$Res, _$_BasketItem>
    implements _$$_BasketItemCopyWith<$Res> {
  __$$_BasketItemCopyWithImpl(
      _$_BasketItem _value, $Res Function(_$_BasketItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(_$_BasketItem(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasketItem with DiagnosticableTreeMixin implements _BasketItem {
  _$_BasketItem({required this.product, required this.quantity});

  factory _$_BasketItem.fromJson(Map<String, dynamic> json) =>
      _$$_BasketItemFromJson(json);

  @override
  Product product;
  @override
  double quantity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BasketItem(product: $product, quantity: $quantity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BasketItem'))
      ..add(DiagnosticsProperty('product', product))
      ..add(DiagnosticsProperty('quantity', quantity));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasketItemCopyWith<_$_BasketItem> get copyWith =>
      __$$_BasketItemCopyWithImpl<_$_BasketItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasketItemToJson(
      this,
    );
  }
}

abstract class _BasketItem implements BasketItem {
  factory _BasketItem({required Product product, required double quantity}) =
      _$_BasketItem;

  factory _BasketItem.fromJson(Map<String, dynamic> json) =
      _$_BasketItem.fromJson;

  @override
  Product get product;
  set product(Product value);
  @override
  double get quantity;
  set quantity(double value);
  @override
  @JsonKey(ignore: true)
  _$$_BasketItemCopyWith<_$_BasketItem> get copyWith =>
      throw _privateConstructorUsedError;
}
