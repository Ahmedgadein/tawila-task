import 'package:flutter/material.dart';
import 'package:tawila/models/restaurant.dart';
import 'package:tawila/screens/restaurants_list/widgets/option_chip.dart';
import 'package:shimmer/shimmer.dart';

class RestaurantListItem extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantListItem({
    required this.restaurant,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 3),
              color: Colors.grey.shade300,
              blurRadius: 5,
            )
          ]),
      child: Column(
        children: [
          Image.network(
            restaurant.photoUrl!,
            fit: BoxFit.fill,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 180.0,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
          Wrap(
            children: [
              OptionChip(
                color: restaurant.hasDelivery != null && restaurant.hasDelivery!
                    ? Colors.teal
                    : Colors.red.shade600,
                text: "Delivery",
                icon: restaurant.hasDelivery != null && restaurant.hasDelivery!
                    ? Icons.delivery_dining_rounded
                    : Icons.no_transfer_rounded,
              ),
              OptionChip(
                color: restaurant.hasReservation != null &&
                        restaurant.hasReservation!
                    ? Colors.teal
                    : Colors.red.shade600,
                text: "Reservation",
                icon: restaurant.hasReservation != null &&
                        restaurant.hasReservation!
                    ? Icons.restaurant_rounded
                    : Icons.no_meals_rounded,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              restaurant.name!,
              style: TextStyle(
                fontFamily: 'Anton',
                color: Colors.black87,
                fontSize: 29,
              ),
            ),
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      size: 24,
                      color: Colors.yellow.shade800,
                    ),
                    Text(
                      "${restaurant.rating!}",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(restaurant.affordability == null
                    ? "💲"
                    : "💲" * restaurant.affordability!)
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     for (var i = 0; i < 3; i++) ...[
                //       Icon(
                //         Icons.attach_money_rounded,
                //         color: Colors.green.shade900,
                //       )
                //     ]
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
