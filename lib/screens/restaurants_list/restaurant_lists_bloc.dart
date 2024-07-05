import 'package:equatable/equatable.dart';
import 'package:tawila/repositories/restaurant_repository.dart';
import 'package:tawila/resources/data_state.dart';

import '../../models/restaurant.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

// =========================   States   ========================= //
abstract class RestaurantListState extends Equatable {
  final List<Restaurant>? restaurants;
  final DioError? error;

  const RestaurantListState({this.restaurants, this.error});

  @override
  List<Object?> get props => [restaurants!, error!];
}

class RestaurantListLoading extends RestaurantListState {}

class RestaurantListLoaded extends RestaurantListState {
  const RestaurantListLoaded(List<Restaurant> restaurants)
      : super(restaurants: restaurants);
}

class RestaurantListError extends RestaurantListState {
  const RestaurantListError(DioError error) : super(error: error);
}

// =========================   Events   ========================= //
abstract class RestaurantListEvent {
  const RestaurantListEvent();
}

class LoadRestaurantList extends RestaurantListEvent {
  const LoadRestaurantList();
}

// =========================   Bloc   ========================= //

class RestaurantListBloc
    extends Bloc<RestaurantListEvent, RestaurantListState> {
  final RestaurantRepository _repository;

  RestaurantListBloc(this._repository) : super(RestaurantListLoading()) {
    on<LoadRestaurantList>(onGetRestaurants);
  }

  Future<void> onGetRestaurants(
      LoadRestaurantList event, Emitter<RestaurantListState> emitter) async {
    final dataState = await _repository.getRestaurants();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RestaurantListLoaded(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RestaurantListError(dataState.error!));
    }
  }
}
