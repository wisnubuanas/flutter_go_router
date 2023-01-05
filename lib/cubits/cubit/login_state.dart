part of 'login_cubit.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class LoginState extends Equatable {
  final AuthStatus status;

  const LoginState._({this.status = AuthStatus.unknown});

  const LoginState.authenthicated()
      : this._(
          status: AuthStatus.authenticated,
        );
  const LoginState.unauthenthicated()
      : this._(
          status: AuthStatus.unauthenticated,
        );

  @override
  List<Object> get props => [status];
}
