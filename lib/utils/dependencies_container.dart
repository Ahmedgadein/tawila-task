import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:tawila/data_sources/tawila_api_service.dart';
import 'package:tawila/repositories/restaurant_repository.dart';
import 'package:tawila/screens/restaurants_list/restaurant_lists_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // TawilaApiService
  sl.registerSingleton<TawilaApiService>(TawilaApiService(sl()));

  // RestaurantRepository
  sl.registerSingleton<RestaurantRepository>(RestaurantRepositoryImpl(sl()));

  // RestaurantListBloc
  sl.registerFactory<RestaurantListBloc>(() => RestaurantListBloc(sl()));
}
