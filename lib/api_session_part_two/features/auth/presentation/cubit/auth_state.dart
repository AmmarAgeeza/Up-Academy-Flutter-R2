

sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class LogoutLoadingState extends AuthState {}
final class LogoutLoadedState extends AuthState {}
final class LogoutErrorState extends AuthState {}
final class ChangePasswordLoadingState extends AuthState {}
final class ChangePasswordLoadedState extends AuthState {}
final class ChangePasswordErrorState extends AuthState {}
final class DeleteLoadingState extends AuthState {}
final class DeleteLoadedState extends AuthState {}
final class DeleteErrorState extends AuthState {}
