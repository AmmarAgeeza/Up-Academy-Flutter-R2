part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class LogoutLoadingState extends ProfileState {}
final class LogoutLoadedState extends ProfileState {}
final class LogoutErrorState extends ProfileState {}
final class ChangePasswordLoadingState extends ProfileState {}
final class ChangePasswordLoadedState extends ProfileState {}
final class ChangePasswordErrorState extends ProfileState {}