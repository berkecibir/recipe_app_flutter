part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSucces extends HomeState {
  final String message;

  HomeSucces(this.message);
}

final class HomeError extends HomeState {
  final String error;

  HomeError({required this.error});
}
