part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoadingLoginState extends LoginState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoggedInState extends LoginState {
  final String username;

  const LoggedInState(this.username);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginErrorState extends LoginState {
  final String error;

  const LoginErrorState(this.error);

  @override
  List<Object?> get props => throw UnimplementedError();
}
