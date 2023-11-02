import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'db_state.dart';

class DbCubit extends Cubit<DbState> {
  DbCubit() : super(DbInitial());
  // create DB and Table
  String data = '''sdlfnsf
fsdgkln
lkdsanhg;kj''';
  late Database db;
  void createDB() async {
    emit(DbLoading());
    try {
      db = await openDatabase('ToDo.db', version: 1,
          onCreate: (Database db, int version) {
        db.execute(
            '''CREATE TABLE Task 
          (id INTEGER PRIMARY KEY,
          title TEXT,
          note TEXT
          ,date TEXT)''');
      });
      print('DB Created');
      emit(DbSucess());
    } catch (e) {
      print(e.toString());
      emit(DbErorr());
    }
  }

  //Insert
  void insertToDB({
    required String title,
    required String note,
    required String date,
  }) async {
    emit(DbInsertLoading());
    // await Future.delayed(const Duration(seconds: 3));
    try {
      db.rawInsert(
          '''
  INSERT INTO Task 
  (title, note, date) 
  VALUES ('$title','$note','$date')
''');
      emit(DbInsertSucess());
    } catch (e) {
      print(e.toString());
      emit(DbInsertErorr());
    }
  }

  //Get
  void getTasksFromDB() async {
    emit(DbGETLoading());
    try {
      List<Map<String, Object?>> tasks =
          await db.rawQuery('''SELECT * FROM Task''');
          // print(tasks);
      List<TaskModel> taskModels =
          tasks.map((element) => TaskModel.fromJson(element)).toList();
      print(taskModels.length);
      // print(taskModels[0].date);

      emit(DbGETSucess());
    } catch (e) {
      print(e.toString());
      emit(DbGETErorr());
    }
  }

  //Update
  void updateDB({
    required int id,
    required String date,
  }) async {
    emit(DbUpdateLoading());

    try {
      await db.rawUpdate(
        '''
UPDATE Task set date = ? where id = ?
  ''',
        [date, id],
      );
      emit(DbUpdateSucess());
    } catch (e) {
      print(e.toString());
      emit(DbUpdateErorr());
    }
  }

  //Delete
  void deleteFromDB({
    required int id,
  }) async {
    emit(DbDeleteLoading());
    try {
      // if(is Exist)
      await db.rawDelete('DELETE FROM Task where id = ? ', [id]);
      emit(DbDeleteSucess());
    } catch (e) {
      print(e.toString());
      emit(DbDeleteErorr());
    }
  }
}
// [{id: 1, title: Dart, note: Basics, date: 8/8},
// {id: 2, title: Dart, note: Basics, date: 8/8},
// {id: 3, title: Dart, note: Basics, date: 8/8}]
//List<Map> =>>>>> List<TaskModel>

class TaskModel {
  final int id;
  final String title;
  final String note;
  final String date;

  TaskModel({
    required this.id,
    required this.title,
    required this.note,
    required this.date,
  });
  // named Constructor
  factory TaskModel.fromJson(Map<String, dynamic> jsonData) {
    return TaskModel(
      id: jsonData['id'],
      title: jsonData['title'],
      note: jsonData['note'],
      date: jsonData['date'],
    );
  }
}
