part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}
class LoginAttemptEvent extends LoginEvent {
  final String username;
  final String password;

  const LoginAttemptEvent(this.username, this.password);

  @override
  List<Object?> get props => throw UnimplementedError();
}

