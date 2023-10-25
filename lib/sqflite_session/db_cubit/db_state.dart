
sealed class DbState {}

final class DbInitial extends DbState {}
final class DbLoading extends DbState {}
final class DbSucess extends DbState {}
final class DbErorr extends DbState {}
final class DbInsertLoading extends DbState {}
final class DbInsertSucess extends DbState {}
final class DbInsertErorr extends DbState {}
final class DbGETLoading extends DbState {}
final class DbGETSucess extends DbState {}
final class DbGETErorr extends DbState {}
final class DbUpdateLoading extends DbState {}
final class DbUpdateSucess extends DbState {}
final class DbUpdateErorr extends DbState {}
final class DbDeleteLoading extends DbState {}
final class DbDeleteSucess extends DbState {}
final class DbDeleteErorr extends DbState {}
