import 'dart:async';

import 'package:cpe231_nsfw_flutter/src/data/models/user.dart';
import 'package:cpe231_nsfw_flutter/src/data/repositories/user_repository.dart';

import '../../../../data/models/password.dart';
import '../../../../data/models/username.dart';
import '../../../../data/repositories/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../../../../data/models/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
      {required AuthenticationRepository authenticationRepository,
      required UserRepository userRepository})
      : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([state.password, username]),
    ));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.username]),
    ));
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
        final res = await _authenticationRepository.logIn(
          username: state.username.value,
          password: state.password.value,
          userRepo: _userRepository,
        ); //
        if (!res.error) {
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
        } else {
          final user = res.data[0];
          //await _userRepository.setUser(user); //
          emit(state.copyWith(status: FormzStatus.submissionFailure));
        }
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
        rethrow;
      }
    }
  }
}
