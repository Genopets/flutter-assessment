// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemEntity _$ItemEntityFromJson(Map<String, dynamic> json) => ItemEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      family: json['family'] as String?,
      variant: json['variant'] as String?,
      itemClass: json['class'] as String?,
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$ItemEntityToJson(ItemEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'family': instance.family,
      'variant': instance.variant,
      'class': instance.itemClass,
      'metadata': instance.metadata,
    };
