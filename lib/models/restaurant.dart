import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant extends Equatable {
  final String? id;
  final String? name;
  final String? rating;
  @JsonKey(name: "photo_url")
  final String? photoUrl;
  final String? description;
  final int? affordability;
  @JsonKey(name: "has_delivery")
  final bool? hasDelivery;
  @JsonKey(name: "has_reservation")
  final bool? hasReservation;

  const Restaurant({
    this.id,
    this.name,
    this.photoUrl,
    this.rating,
    this.description,
    this.affordability,
    this.hasDelivery,
    this.hasReservation,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        rating,
        photoUrl,
        description,
        affordability,
        hasDelivery,
        hasReservation,
      ];

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}
