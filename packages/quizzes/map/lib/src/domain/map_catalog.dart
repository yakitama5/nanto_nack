import 'package:flutter/material.dart';
import 'package:map/src/domain/entities/map_place.dart';

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
      colorSeed: 0,
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

  /// ピンカラーパレット
  static const List<Color> pinColors = [
    Color(0xFF1565C0),
    Color(0xFF2E7D32),
    Color(0xFFC62828),
    Color(0xFFE65100),
    Color(0xFF6A1B9A),
  ];

  /// クイズ3のルート情報
  static const MapPlace destination = MapPlace(
    id: 'p3',
    name: 'Main Station',
    address: '3-10 Station St',
    lat: 35.683,
    lng: 139.771,
    colorSeed: 2,
    icon: Icons.train,
  );

  /// ルート距離（km）
  static const double routeDistanceKm = 2.3;

  /// ルート時間（分）
  static const int routeMinutes = 8;
}
