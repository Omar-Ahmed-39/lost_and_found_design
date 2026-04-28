part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  
}
final class SinginLoading extends AuthState {}

final class SinginSuccess extends AuthState {
   final SignInModel user;

  SinginSuccess({required this.user});
}
final class SinginErorr extends AuthState {
  final String message;

  SinginErorr({required this.message});
}





final class SingupLoading extends AuthState {}
final class SingupSuccess extends AuthState {}
final class SingupErorr extends AuthState {
    final String message;

  SingupErorr({required this.message});

}


