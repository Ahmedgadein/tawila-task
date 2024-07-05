// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      id: json['id'] as String?,
      name: json['name'] as String?,
      photoUrl: json['photo_url'] as String?,
      rating: json['rating'] as String?,
      description: json['description'] as String?,
      affordability: (json['affordability'] as num?)?.toInt(),
      hasDelivery: json['has_delivery'] as bool?,
      hasReservation: json['has_reservation'] as bool?,
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'photo_url': instance.photoUrl,
      'description': instance.description,
      'affordability': instance.affordability,
      'has_delivery': instance.hasDelivery,
      'has_reservation': instance.hasReservation,
    };
