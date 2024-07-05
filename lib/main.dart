import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawila/screens/restaurants_list/restaurant_lists_bloc.dart';
import 'package:tawila/screens/restaurants_list/restaurants_list_screen.dart';
import 'package:tawila/screens/splash_screen/splash_screen.dart';
import 'package:tawila/utils/dependencies_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RestaurantListBloc>(
      create: (context) => sl()..add(const LoadRestaurantList()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tawila',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
