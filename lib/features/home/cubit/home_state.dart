part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<Post> posts;

  HomeSuccess({required this.posts});

  @override
  List<Object> get props => [posts];
}

final class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});

  @override
  List<Object> get props => [message];
}