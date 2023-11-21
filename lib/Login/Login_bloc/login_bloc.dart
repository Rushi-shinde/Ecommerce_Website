import 'dart:async';
import 'package:bloc/bloc.dart';
import '../Login_repo/login_fetch_api.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthApi authApi;

  LoginBloc({required this.authApi}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final token = await authApi.login(
          username: event.username,
          password: event.password,
        );

        if (token.isEmpty) {
          yield LoginSuccess(token: token);
        } else {
          yield const LoginFailure(error: 'Invalid username or password');
        }

      } catch (error) {
        yield const LoginFailure(error: 'Login failed. Please try again.');
      }
    }
  }
}
