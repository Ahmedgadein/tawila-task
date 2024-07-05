import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tawila/screens/restaurants_list/restaurant_lists_bloc.dart';
import 'package:tawila/screens/restaurants_list/widgets/restaurant_list_item.dart';
import 'package:tawila/screens/restaurants_list/widgets/search_widget.dart';

class RestaurantsList extends StatefulWidget {
  RestaurantsList({super.key});

  @override
  State<RestaurantsList> createState() => _RestaurantsListState();
}

class _RestaurantsListState extends State<RestaurantsList> {
  int _currentState = 0;

  // Application Screens
  Widget selectScreen() {
    switch (_currentState) {
      case 3:
        return const Center(
          child: Text("🛠 Settings Screen"),
        );
      case 2:
        return const Center(
          child: Text("💟 Favorites"),
        );

      case 1:
        return const Center(
          child: Text("🌮 Orders Screen"),
        );

      case 0:
      default:
        return _buildBody();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade400,
        // Theme.of(context).colorScheme.background,
        title: Image(
          image: const AssetImage('assets/images/tawila_logo.png'),
          height: AppBar().preferredSize.height,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.cart),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.person),
          )
        ],
      ),
      bottomNavigationBar: GNav(
        gap: 8.0,
        color: Colors.grey.shade700,
        activeColor: Colors.deepPurple,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.fastfood_rounded,
            text: "Orders",
          ),
          GButton(
            icon: Icons.favorite_rounded,
            text: "Favorites",
          ),
          GButton(
            icon: Icons.settings,
            text: "Settings",
          ),
        ],
        onTabChange: (index) {
          setState(() {
            _currentState = index;
          });
        },
      ),
      body: selectScreen(),
    );
  }
}

Widget _buildBody() {
  return Column(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow.shade400,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Hello, Ahmed",
                  style: TextStyle(
                    color: Colors.deepPurple.shade400,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Find Your Food",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SearchWidget(),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ],
      ),
      BlocBuilder<RestaurantListBloc, RestaurantListState>(
        builder: (_, state) {
          if (state is RestaurantListLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if (state is RestaurantListError) {
            return const Center(
              child: Icon(Icons.refresh),
            );
          }

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 9 / 16,
                ),
                itemCount: state.restaurants!.length,
                itemBuilder: (context, index) {
                  return RestaurantListItem(
                    restaurant: state.restaurants![index],
                  );
                },
              ),
            ),
          );
        },
      ),
    ],
  );
}
