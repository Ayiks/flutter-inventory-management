import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_stats.freezed.dart';
part 'dashboard_stats.g.dart';

@freezed
class DashboardStats with _$DashboardStats {
  factory DashboardStats({
    required int totalProductCount,
    required int lowOnStockProductsCount,
    required int outOfStockProductsCount,
    required double dailySales,
    // required String storeId,
  }) = _DashboardStats;

  factory DashboardStats.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatsFromJson(json);
}
