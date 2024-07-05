import 'package:tawila/data_sources/tawila_api_service.dart';
import 'package:tawila/models/restaurant.dart';
import 'package:tawila/resources/data_state.dart';
import 'package:dio/dio.dart';

abstract class RestaurantRepository {
  Future<DataState<List<Restaurant>>> getRestaurants();
}

class RestaurantRepositoryImpl extends RestaurantRepository {
  final TawilaApiService _apiService;

  RestaurantRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<Restaurant>>> getRestaurants() async {
    try {
      final res = await _apiService.getRestaurants();
      return DataSuccess(res);
    } catch (e) {
      print("Error: $e");
      if (e is DioError) {
        return DataFailed(e);
      } else {
        final error = DioError(
          requestOptions: RequestOptions(),
          message: "Unknown Error",
        );

        return DataFailed(error);
      }
    }
  }
}
