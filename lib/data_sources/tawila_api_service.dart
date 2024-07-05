import 'package:retrofit/http.dart';
import 'package:tawila/models/restaurant.dart';
import 'package:tawila/resources/constants.dart';
import 'package:dio/dio.dart';

part 'tawila_api_service.g.dart';

@RestApi(baseUrl: tawilaAPIBaseURL)
abstract class TawilaApiService {
  factory TawilaApiService(Dio dio) = _TawilaApiService;


  @GET("api/v1/restaurants/")
  Future<List<Restaurant>> getRestaurants();
}
