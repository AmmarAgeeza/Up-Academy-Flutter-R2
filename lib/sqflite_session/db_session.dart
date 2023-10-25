import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_flutter_round_two/sqflite_session/db_cubit/db_cubit.dart';

import 'db_cubit/db_state.dart';

class DBSession extends StatelessWidget {
  const DBSession({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DbCubit()..createDB(),
      child: BlocConsumer<DbCubit, DbState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('DB Session')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //insert to DB
                  state is DbInsertLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<DbCubit>(context).insertToDB(
                              title: 'Dart',
                              note: 'Basics',
                              date: '8/8',
                            );
                          },
                          child: const Text('Insert to DB'),
                        ),
                  //GET to DB
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<DbCubit>(context).getTasksFromDB();
                    },
                    child: const Text('GET From DB'),
                  ),
                  //Update to DB
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<DbCubit>(context).updateDB(
                        id: 1,
                        date: '9/9',
                      );
                    },
                    child: const Text('Update to DB'),
                  ),
                  //Delete to DB
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<DbCubit>(context).deleteFromDB(
                        id: 6,
                      );
                    },
                    child: const Text('Delete to DB'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
