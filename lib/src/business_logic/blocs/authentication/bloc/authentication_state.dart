part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  AuthenticationState._(
      {this.status = AuthenticationStatus.unknown, User? user})
      : user = user ?? User.empty();

  AuthenticationState.unknown() : this._(status: AuthenticationStatus.unknown);

  AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
