part of 'favorites_cubit.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<int> favoriteIds;

  FavoritesLoaded(this.favoriteIds);
}

class FavoritesError extends FavoritesState {
  final String message;

  FavoritesError(this.message);
}
