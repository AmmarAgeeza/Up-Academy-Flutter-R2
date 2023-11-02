
sealed class PostsState {}

final class PostsInitial extends PostsState {}
final class PostsLoading extends PostsState {}
final class PostsSucess extends PostsState {}
final class PostsError extends PostsState {
  final String message;

  PostsError({required this.message});
}
