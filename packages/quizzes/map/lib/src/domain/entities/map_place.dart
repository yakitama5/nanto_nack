import 'package:flutter/material.dart';

/// マップの場所エンティティ
class MapPlace {
  /// コンストラクタ
  const MapPlace({
    required this.id,
    required this.name,
    required this.address,
    required this.lat,
    required this.lng,
    this.isFavorite = false,
    this.colorSeed = 0,
    this.icon = Icons.location_on,
  });

  /// ID
  final String id;

  /// 場所名（カスタム言語で表示）
  final String name;

  /// 住所（カスタム言語で表示）
  final String address;

  /// 緯度（擬似）
  final double lat;

  /// 経度（擬似）
  final double lng;

  /// お気に入りかどうか
  final bool isFavorite;

  /// カラーシード
  final int colorSeed;

  /// アイコン
  final IconData icon;

  /// インスタンスをコピーする
  MapPlace copyWith({
    String? id,
    String? name,
    String? address,
    double? lat,
    double? lng,
    bool? isFavorite,
    int? colorSeed,
    IconData? icon,
  }) {
    return MapPlace(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      isFavorite: isFavorite ?? this.isFavorite,
      colorSeed: colorSeed ?? this.colorSeed,
      icon: icon ?? this.icon,
    );
  }
}
