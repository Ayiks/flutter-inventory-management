// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DashboardStats _$DashboardStatsFromJson(Map<String, dynamic> json) {
  return _DashboardStats.fromJson(json);
}

/// @nodoc
mixin _$DashboardStats {
  int get totalProductCount => throw _privateConstructorUsedError;
  int get lowOnStockProductsCount => throw _privateConstructorUsedError;
  int get outOfStockProductsCount => throw _privateConstructorUsedError;
  double get dailySales => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardStatsCopyWith<DashboardStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStatsCopyWith<$Res> {
  factory $DashboardStatsCopyWith(
          DashboardStats value, $Res Function(DashboardStats) then) =
      _$DashboardStatsCopyWithImpl<$Res, DashboardStats>;
  @useResult
  $Res call(
      {int totalProductCount,
      int lowOnStockProductsCount,
      int outOfStockProductsCount,
      double dailySales});
}

/// @nodoc
class _$DashboardStatsCopyWithImpl<$Res, $Val extends DashboardStats>
    implements $DashboardStatsCopyWith<$Res> {
  _$DashboardStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProductCount = null,
    Object? lowOnStockProductsCount = null,
    Object? outOfStockProductsCount = null,
    Object? dailySales = null,
  }) {
    return _then(_value.copyWith(
      totalProductCount: null == totalProductCount
          ? _value.totalProductCount
          : totalProductCount // ignore: cast_nullable_to_non_nullable
              as int,
      lowOnStockProductsCount: null == lowOnStockProductsCount
          ? _value.lowOnStockProductsCount
          : lowOnStockProductsCount // ignore: cast_nullable_to_non_nullable
              as int,
      outOfStockProductsCount: null == outOfStockProductsCount
          ? _value.outOfStockProductsCount
          : outOfStockProductsCount // ignore: cast_nullable_to_non_nullable
              as int,
      dailySales: null == dailySales
          ? _value.dailySales
          : dailySales // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DashboardStatsCopyWith<$Res>
    implements $DashboardStatsCopyWith<$Res> {
  factory _$$_DashboardStatsCopyWith(
          _$_DashboardStats value, $Res Function(_$_DashboardStats) then) =
      __$$_DashboardStatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalProductCount,
      int lowOnStockProductsCount,
      int outOfStockProductsCount,
      double dailySales});
}

/// @nodoc
class __$$_DashboardStatsCopyWithImpl<$Res>
    extends _$DashboardStatsCopyWithImpl<$Res, _$_DashboardStats>
    implements _$$_DashboardStatsCopyWith<$Res> {
  __$$_DashboardStatsCopyWithImpl(
      _$_DashboardStats _value, $Res Function(_$_DashboardStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProductCount = null,
    Object? lowOnStockProductsCount = null,
    Object? outOfStockProductsCount = null,
    Object? dailySales = null,
  }) {
    return _then(_$_DashboardStats(
      totalProductCount: null == totalProductCount
          ? _value.totalProductCount
          : totalProductCount // ignore: cast_nullable_to_non_nullable
              as int,
      lowOnStockProductsCount: null == lowOnStockProductsCount
          ? _value.lowOnStockProductsCount
          : lowOnStockProductsCount // ignore: cast_nullable_to_non_nullable
              as int,
      outOfStockProductsCount: null == outOfStockProductsCount
          ? _value.outOfStockProductsCount
          : outOfStockProductsCount // ignore: cast_nullable_to_non_nullable
              as int,
      dailySales: null == dailySales
          ? _value.dailySales
          : dailySales // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DashboardStats implements _DashboardStats {
  _$_DashboardStats(
      {required this.totalProductCount,
      required this.lowOnStockProductsCount,
      required this.outOfStockProductsCount,
      required this.dailySales});

  factory _$_DashboardStats.fromJson(Map<String, dynamic> json) =>
      _$$_DashboardStatsFromJson(json);

  @override
  final int totalProductCount;
  @override
  final int lowOnStockProductsCount;
  @override
  final int outOfStockProductsCount;
  @override
  final double dailySales;

  @override
  String toString() {
    return 'DashboardStats(totalProductCount: $totalProductCount, lowOnStockProductsCount: $lowOnStockProductsCount, outOfStockProductsCount: $outOfStockProductsCount, dailySales: $dailySales)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DashboardStats &&
            (identical(other.totalProductCount, totalProductCount) ||
                other.totalProductCount == totalProductCount) &&
            (identical(
                    other.lowOnStockProductsCount, lowOnStockProductsCount) ||
                other.lowOnStockProductsCount == lowOnStockProductsCount) &&
            (identical(
                    other.outOfStockProductsCount, outOfStockProductsCount) ||
                other.outOfStockProductsCount == outOfStockProductsCount) &&
            (identical(other.dailySales, dailySales) ||
                other.dailySales == dailySales));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalProductCount,
      lowOnStockProductsCount, outOfStockProductsCount, dailySales);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DashboardStatsCopyWith<_$_DashboardStats> get copyWith =>
      __$$_DashboardStatsCopyWithImpl<_$_DashboardStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DashboardStatsToJson(
      this,
    );
  }
}

abstract class _DashboardStats implements DashboardStats {
  factory _DashboardStats(
      {required final int totalProductCount,
      required final int lowOnStockProductsCount,
      required final int outOfStockProductsCount,
      required final double dailySales}) = _$_DashboardStats;

  factory _DashboardStats.fromJson(Map<String, dynamic> json) =
      _$_DashboardStats.fromJson;

  @override
  int get totalProductCount;
  @override
  int get lowOnStockProductsCount;
  @override
  int get outOfStockProductsCount;
  @override
  double get dailySales;
  @override
  @JsonKey(ignore: true)
  _$$_DashboardStatsCopyWith<_$_DashboardStats> get copyWith =>
      throw _privateConstructorUsedError;
}
