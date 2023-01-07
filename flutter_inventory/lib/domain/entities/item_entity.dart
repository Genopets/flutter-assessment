import 'package:flutter/foundation.dart';
import 'package:flutter_inventory/data/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'item_entity.g.dart';

/// Business object of the application
/// Least likely to change when something in the application changes
/// All mapper methods must be inserted in corresponding entity mapper at Data Layer

@JsonSerializable()
@immutable
class ItemEntity {
  const ItemEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    this.family,
    this.variant,
    this.itemClass,
    this.metadata,
  });

  factory ItemEntity.fromJson(Map<String, dynamic> json) =>
      _$ItemEntityFromJson(json);

  final String id;

  final String name;

  final String description;

  final String type;

  final String? family;

  final String? variant;

  @JsonKey(name: 'class')
  final String? itemClass;

  final Map<String, String>? metadata;

  Map<String, dynamic> toJson() => _$ItemEntityToJson(this);

  @override
  String toString() =>
      'ItemEntity(id: $id, name: $name,  description: $description';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemEntity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  Future<String> getImageUrl() async {
    final gifUrl = '${Constants.inAppImageBaseUrl}/$id.gif';
    final pngUrl = '${Constants.inAppImageBaseUrl}/$id.png';

    final response = await http.head(Uri.parse(gifUrl));

    if (response.statusCode == 200) return gifUrl;

    return pngUrl;
  }
}

String getItemImageUrl(ItemEntity item, {bool asGif = true}) =>
    '${Constants.inAppImageBaseUrl}/${item.id}.${asGif ? 'gif' : 'png'}';
