import 'package:flutter/material.dart';
import 'entities/map_place.dart';

/// マップアプリのマスターデータカタログ
class MapCatalog {
  MapCatalog._();

  /// 近くの場所リスト
  static const List<MapPlace> places = [
    MapPlace(
      id: 'p1',
      name: 'City Hall',
      address: '1-1 Central Ave',
      lat: 35.681,
      lng: 139.767,
      icon: Icons.account_balance,
    ),
    MapPlace(
      id: 'p2',
      name: 'Grand Park',
      address: '2-5 Park Blvd',
      lat: 35.682,
      lng: 139.769,
      colorSeed: 1,
      icon: Icons.park,
    ),
    MapPlace(
      id: 'p3',
      name: 'Main Station',
      address: '3-10 Station St',
      lat: 35.683,
      lng: 139.771,
      colorSeed: 2,
      icon: Icons.train,
    ),
    MapPlace(
      id: 'p4',
      name: 'Shopping Mall',
      address: '4-2 Commerce Rd',
      lat: 35.684,
      lng: 139.773,
      colorSeed: 3,
      icon: Icons.shopping_bag,
    ),
    MapPlace(
      id: 'p5',
      name: 'University',
      address: '5-8 Campus Dr',
      lat: 35.685,
      lng: 139.775,
      colorSeed: 4,
      icon: Icons.school,
    ),
  ];

  /// クイズ3の正解目的地（Grand Park）
  static const MapPlace destination = MapPlace(
    id: 'p2',
    name: 'Grand Park',
    address: '2-5 Park Blvd',
    lat: 35.682,
    lng: 139.769,
    colorSeed: 1,
    icon: Icons.park,
  );

  /// 各地点の現在地からの擬似距離（km）
  ///
  /// 現在地はキャンバス中央（初期表示中心）を起点とした擬似的な値。
  static const Map<String, double> placeDistancesKm = {
    'p1': 1.2, // City Hall: 近め
    'p2': 2.3, // Grand Park: 中程度（クイズ3の正解目的地）
    'p3': 1.8, // Main Station: やや近め
    'p4': 3.5, // Shopping Mall: 遠め
    'p5': 2.8, // University: やや遠め
  };

  /// 交通手段ごとの移動速度（km/h）
  ///
  /// インデックスは [_NavigationPanel._transportIcons] に対応する。
  /// 0=車, 1=徒歩, 2=電車, 3=自転車
  static const List<double> transportSpeedsKmH = [
    30.0, // 車（市街地渋滞込み）
    5.0, // 徒歩
    17.0, // 電車（駅待ち時間込み）
    15.0, // 自転車
  ];

  /// 指定した地点・交通手段での移動時間（分）を計算する。
  ///
  /// [placeId] に対応する距離が存在しない場合は [routeDistanceKm] を使用する。
  /// 計算式: round(distance / speed * 60)、最小1分。
  static int calcRouteMinutes(String placeId, int transportIndex) {
    final distance = placeDistancesKm[placeId] ?? routeDistanceKm;
    if (transportIndex < 0 || transportIndex >= transportSpeedsKmH.length) {
      return routeMinutes;
    }
    final speed = transportSpeedsKmH[transportIndex];
    return (distance / speed * 60).round().clamp(1, 999);
  }

  /// フォールバック用のルート距離（km）
  static const double routeDistanceKm = 2.3;

  /// フォールバック用のルート時間（分）
  static const int routeMinutes = 8;
}
